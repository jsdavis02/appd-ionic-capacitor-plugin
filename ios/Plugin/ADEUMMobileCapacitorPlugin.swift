import Foundation
import ADEUMInstrumentation
import Capacitor

@objc public class ADEUMMobileCapacitorPlugin: NSObject {
    
    var reference_map = [String:Any]()
    private let VERSION = "1.1.0"
    
    @objc public func generateKey() -> String {
        return UUID().uuidString
    }
    
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
    @objc public func pluginInitialize(config: ADEumAgentConfiguration) -> Void {
        ADEumInstrumentation.initWith(config)
    }
    @objc public func startTimerWithName(name: String) -> Void {
        ADEumInstrumentation.startTimer(withName: name)
    }
    @objc public func stopTimerWithName(name: String) -> Void {
        ADEumInstrumentation.stopTimer(withName: name)
    }
    @objc public func reportMetricWithName(name: String, value: Int64) -> Void {
        ADEumInstrumentation.reportMetric(withName: name, value: value)
    }
    @objc public func leaveBreadcrumb(name: String?) -> Void {
        //debugPrint(name as Any)
        ADEumInstrumentation.leaveBreadcrumb(name)
    }
    @objc public func setUserData(key: String, value: String) -> Void {
        ADEumInstrumentation.setUserData(key, value: value)
    }
    @objc public func removeUserData(key: String) -> Void {
        ADEumInstrumentation.removeUserData(key)
    }
    @objc public func takeScreenshot() -> Void {
        ADEumInstrumentation.takeScreenshot()
    }
    @objc public func reportError(error: String, severity: ADEumErrorSeverityLevel, withStack: Bool, errorCode: Int, errorDomain: String) -> Void {
        //debugPrint(error as Any)
        let e = NSError(domain: errorDomain, code: errorCode, userInfo: [NSLocalizedDescriptionKey : error])
        //debugPrint(e as Any)
        ADEumInstrumentation.reportError(e, withSeverity: severity, andStackTrace: withStack)
    }
    /*
     * For the plugin I do not think any ios centric beginCall makes sense
    @objc public func beginCall(receiver: Any, selector: Selector, withArguments: [Any]?) -> Any? {
        //ADEumInstrumentation.beginCall(<#T##receiver: Any##Any#>, selector: <#T##Selector#>)
        return ADEumInstrumentation.beginCall(receiver, selector: selector, withArguments: withArguments)
        
    }*/
    @objc public func beginCall(className: String, methodName: String, withArguments: [Any]) -> String {
        let call = ADEumInstrumentation.beginCall(className, methodName: methodName, withArguments: withArguments)
        let key = self.generateKey()
        reference_map[key] = call
        return key
    }
    
    @objc public func endCall(tracker_key: String) -> Void {
        let tracker = reference_map[tracker_key]
        ADEumInstrumentation.endCall(tracker)
    }
    
    @objc public func getCorrelationHeaders() -> Any {
        let headers = ADEumServerCorrelationHeaders.generate()
        return headers
    }
    
    @objc public func beginHttpRequest(url: URL) -> String {
        
        let http_tracker = ADEumHTTPRequestTracker.init(url: url)
        let key = self.generateKey()
        reference_map[key] = http_tracker
        return key
    }
    
    @objc public func reportDone(tracker_key: String) -> Void {
        
        let tracker = reference_map[tracker_key] as? ADEumHTTPRequestTracker
        tracker?.reportDone()
        reference_map.removeValue(forKey: tracker_key)
    }
    
    
    @objc public func withResponseCode(tracker_key: String, statusCode: NSNumber) {
        let tracker = reference_map[tracker_key] as? ADEumHTTPRequestTracker
        //let http_tracker = tracker as! ADEumHTTPRequestTracker
        tracker?.statusCode = statusCode
        reference_map.updateValue(tracker as Any, forKey: tracker_key)
    }
    
    @objc public func withResponseContentLength(tracker_key: String, responseContentLength: NSNumber) {
        let tracker = reference_map[tracker_key] as? ADEumHTTPRequestTracker
        let tmpHeaders = tracker?.allHeaderFields as! NSMutableDictionary
        tmpHeaders.setValue(responseContentLength, forKeyPath: "Content-Length")
        tracker?.allHeaderFields = tmpHeaders as? [AnyHashable : Any]
        reference_map.updateValue(tracker as Any, forKey: tracker_key)
    }
    
    @objc public func withRequestContentLength(tracker_key: String, requestContentLength: NSNumber) {
        let tracker = reference_map[tracker_key] as? ADEumHTTPRequestTracker
        let tmpHeaders = tracker?.allRequestHeaderFields as! NSMutableDictionary
        tmpHeaders.setValue(requestContentLength, forKeyPath: "Content-Length")
        tracker?.allRequestHeaderFields = tmpHeaders as? [AnyHashable : Any]
        reference_map.updateValue(tracker as Any, forKey: tracker_key)
    }
    
    @objc public func withResponseHeaderFields(tracker_key: String, responseHeaders: NSDictionary) {
        let tracker = reference_map[tracker_key] as? ADEumHTTPRequestTracker
        tracker?.allHeaderFields = responseHeaders as? [AnyHashable : Any]
        reference_map.updateValue(tracker as Any, forKey: tracker_key)
    }
    
    @objc public func withRequestHeaderFields(tracker_key: String, requestHeaders: NSDictionary) {
        let tracker = reference_map[tracker_key] as? ADEumHTTPRequestTracker
        tracker?.allRequestHeaderFields = requestHeaders as? [AnyHashable : Any]
        reference_map.updateValue(tracker as Any, forKey: tracker_key)
    }
    
    @objc public func withInstrumentationSource(tracker_key: String, informationSource: String) {
        let tracker = reference_map[tracker_key] as? ADEumHTTPRequestTracker
        tracker?.instrumentationSource = informationSource
        reference_map.updateValue(tracker as Any, forKey: tracker_key)
    }
    
    @objc public func withErrorMessage(tracker_key: String, errorMessage: String) {
        let tracker = reference_map[tracker_key] as? ADEumHTTPRequestTracker
        let http_error = NSError(domain: "com.appdynamics.ionic", code: -100, userInfo: [NSLocalizedDescriptionKey: errorMessage])
        tracker?.error = http_error
        reference_map.updateValue(tracker as Any, forKey: tracker_key)
    }
    
    @objc public func startNextSession() -> Void {
        ADEumInstrumentation.startNextSession()
    }
    
    @objc public func unblockScreenshots() -> Void {
        ADEumInstrumentation.unblockScreenshots()
    }
    
    @objc public func blockScreenshots() -> Void {
        ADEumInstrumentation.blockScreenshots()
    }
    
    @objc public func screenshotsBlocked() -> Bool {
        return ADEumInstrumentation.screenshotsBlocked()
    }
    
    @objc public func startSessionFrame(sessionFrameName: String) -> String {
        let session = ADEumInstrumentation.startSessionFrame(sessionFrameName)
        let key = self.generateKey()
        reference_map[key] = session
        return key
    }
    
    @objc public func endSessionFrame(session_key: String) -> Void {
        let session = reference_map[session_key] as? ADEumSessionFrame
        session?.end()
        reference_map.removeValue(forKey: session_key)
    }
    
    @objc public func updateSessionFrameName(session_key: String, session_name: String) -> Void {
        let session = reference_map[session_key] as? ADEumSessionFrame
        session?.updateName(session_name)
        reference_map.updateValue(session as Any, forKey: session_key)
    }
    
    @objc public func getVersion() -> String {
        return VERSION
    }
    
    @objc public func clear() -> Void {
        reference_map.removeAll()
    }
    
}
