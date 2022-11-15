/// <reference types="@capacitor/cli" />

export interface EchoOptions {
  value: string;
}
export interface StartTimerOptions {
  name: string;
}
export interface StopTimerOptions {
  name: string;
}
export interface ReportMetricWithNameOptions {
  name: string;
  value: number;
}
export interface LeaveBreadcrumbOptions {
  name: string;
}
export interface SetUserDataOptions {
  key: string;
  value: string;
}
export interface RemoveUserDataOptions {
  key: string;
}
export interface BeginHttpRequestOptions {
  url: string;
}
export enum ErrorSeverityLevel {
  errorLevelInfo = 0,
  errorLevelWarn,
  errorLevelCritical,
}
export interface ReportErrorOptions {
  error: string;
  errorDomain: string;
  errorCode: number;
  errorStack: boolean;
  errorSeverity: ErrorSeverityLevel;
}
export interface BeginCallOptions {
  className: string;
  methodName: string;
  withArguments: [];
}
export interface EndCallOptions {
  call_tracker: string;
}
export interface ReportDoneOptions {
  http_tracker: string;
}
export interface HttpTrackerResponseCodeOptions {
  http_tracker: string;
  status_code: string;
}
export interface HttpTrackerContentLengthOptions {
  http_tracker: string;
  content_length: number;
}
export interface HttpTrackerHeaderOptions {
  http_tracker: string;
  http_headers: Map<string, string>;
}
export interface HttpTrackerInstrumentationSourceOptions {
  http_tracker: string;
  information_source: string;
}
export interface HttpTrackerErrorMessageOptions {
  http_tracker: string;
  error_message: string;
}
export interface StartSessionFrameOptions {
  session_frame_name: string;
}
export interface EndSessionFrameOptions {
  session_frame: string;
}
export interface UpdateSessionFrameOptions {
  session_frame_name: string;
  session_frame: string;
}

export interface ADEUMMobileCapacitorPluginPlugin {
  echo(options: EchoOptions): Promise<EchoOptions>;
  startTimer(options: StartTimerOptions): Promise<void>;
  stopTimer(options: StopTimerOptions): Promise<void>;
  reportMetricWithName(options: ReportMetricWithNameOptions): Promise<void>;
  leaveBreadcrumb(options: LeaveBreadcrumbOptions): Promise<void>;
  setUserData(options: SetUserDataOptions): Promise<void>;
  removeUserData(options: RemoveUserDataOptions): Promise<void>;
  reportError(options: ReportErrorOptions): Promise<void>;
  beginCall(options: BeginCallOptions): Promise<EndCallOptions>;
  endCall(options: EndCallOptions): Promise<void>;
  beginHttpRequest(
    options: BeginHttpRequestOptions,
  ): Promise<{
    http_tracker: string;
  }>;
  reportDone(options: ReportDoneOptions): Promise<void>;
  withResponseCode(options: HttpTrackerResponseCodeOptions): Promise<void>;
  withResponseContentLength(
    options: HttpTrackerContentLengthOptions,
  ): Promise<void>;
  withRequestContentLength(
    options: HttpTrackerContentLengthOptions,
  ): Promise<void>;
  withResponseHeaderFields(options: HttpTrackerHeaderOptions): Promise<void>;
  withRequestHeaderFields(options: HttpTrackerHeaderOptions): Promise<void>;
  withInstrumentationSource(
    options: HttpTrackerInstrumentationSourceOptions,
  ): Promise<void>;
  withErrorMessage(options: HttpTrackerErrorMessageOptions): Promise<void>;
  getCorrelationHeaders(): Promise<{ headers: Map<string, string> }>;
  startNextSession(): Promise<void>;
  unblockScreenshots(): Promise<void>;
  blockScreenshots(): Promise<void>;
  screenshotsBlocked(): Promise<{ screenshots_blocked: boolean }>;
  takeScreenshot(): Promise<void>;
  startSessionFrame(
    options: StartSessionFrameOptions,
  ): Promise<{
    session_frame: string;
  }>;
  endSessionFrame(options: EndSessionFrameOptions): Promise<void>;
  updateSessionFrameName(
    options: UpdateSessionFrameOptions,
  ): Promise<{
    session_frame: string;
  }>;
  getVersion(): Promise<{ version: string }>;
  clear(): Promise<void>;
}
declare module '@capacitor/cli' {
  export interface PluginsConfig {
    ADEUMMobileCapacitorPlugin?: {
      ADEUM_APP_KEY: string;
      ADEUM_COLLECTOR_URL: string;
      ADEUM_SCREENSHOT_URL: string;
      ADEUM_SCREENSHOTS_ENABLED: boolean;
      ADEUM_LOGGING_LEVEL: number;
      ADEUM_REACHABILITY_HOST: string;
      ADEUM_INTERACTION_CAPTURE_MODE: number;
    };
  }
}
