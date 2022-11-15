# appd-ionic-capacitor-plugin

AppDynamics Mobile EUM Agent Plugin

## Install

1. Download the repository this README is in. https://github.com/jeremydavis02/appd-ionic-capacitor-plugin
2. In the downloaded repos main folder run 'npm install'
3. Then run 'npm run build'
4. In the ionic application we then run 'npm install /path/to/plugin/repo'
5. In the ionic application then run 'npx cap sync'
6. In the IOS application within the ionic application the cocoa pod install of
   the AppDynamics Agent should be done, referenced here: https://docs.appdynamics.com/appd/22.x/22.5/en/end-user-monitoring/mobile-real-user-monitoring/instrument-ios-applications/install-the-ios-sdk#id-.InstalltheiOSSDKv22.1-cocoapods-install
7. In the Android application with the ionic application, there should be an /app/build.gradle file that
   should have the below added below the apply plugin: 'com.android.application' line:

buildscript {
repositories {
google()
mavenCentral()
}
dependencies {
classpath 'com.android.tools.build:gradle:7.2.1'
classpath "com.appdynamics:appdynamics-gradle-plugin:22.2.2"
}
}

apply plugin: 'adeum'

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`startTimer(...)`](#starttimer)
* [`stopTimer(...)`](#stoptimer)
* [`reportMetricWithName(...)`](#reportmetricwithname)
* [`leaveBreadcrumb(...)`](#leavebreadcrumb)
* [`setUserData(...)`](#setuserdata)
* [`removeUserData(...)`](#removeuserdata)
* [`reportError(...)`](#reporterror)
* [`beginCall(...)`](#begincall)
* [`endCall(...)`](#endcall)
* [`beginHttpRequest(...)`](#beginhttprequest)
* [`reportDone(...)`](#reportdone)
* [`withResponseCode(...)`](#withresponsecode)
* [`withResponseContentLength(...)`](#withresponsecontentlength)
* [`withRequestContentLength(...)`](#withrequestcontentlength)
* [`withResponseHeaderFields(...)`](#withresponseheaderfields)
* [`withRequestHeaderFields(...)`](#withrequestheaderfields)
* [`withInstrumentationSource(...)`](#withinstrumentationsource)
* [`withErrorMessage(...)`](#witherrormessage)
* [`getCorrelationHeaders()`](#getcorrelationheaders)
* [`startNextSession()`](#startnextsession)
* [`unblockScreenshots()`](#unblockscreenshots)
* [`blockScreenshots()`](#blockscreenshots)
* [`screenshotsBlocked()`](#screenshotsblocked)
* [`takeScreenshot()`](#takescreenshot)
* [`startSessionFrame(...)`](#startsessionframe)
* [`endSessionFrame(...)`](#endsessionframe)
* [`updateSessionFrameName(...)`](#updatesessionframename)
* [`getVersion()`](#getversion)
* [`clear()`](#clear)
* [Interfaces](#interfaces)
* [Enums](#enums)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: EchoOptions) => Promise<EchoOptions>
```

| Param         | Type                                                |
| ------------- | --------------------------------------------------- |
| **`options`** | <code><a href="#echooptions">EchoOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#echooptions">EchoOptions</a>&gt;</code>

--------------------


### startTimer(...)

```typescript
startTimer(options: StartTimerOptions) => Promise<void>
```

| Param         | Type                                                            |
| ------------- | --------------------------------------------------------------- |
| **`options`** | <code><a href="#starttimeroptions">StartTimerOptions</a></code> |

--------------------


### stopTimer(...)

```typescript
stopTimer(options: StopTimerOptions) => Promise<void>
```

| Param         | Type                                                          |
| ------------- | ------------------------------------------------------------- |
| **`options`** | <code><a href="#stoptimeroptions">StopTimerOptions</a></code> |

--------------------


### reportMetricWithName(...)

```typescript
reportMetricWithName(options: ReportMetricWithNameOptions) => Promise<void>
```

| Param         | Type                                                                                |
| ------------- | ----------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#reportmetricwithnameoptions">ReportMetricWithNameOptions</a></code> |

--------------------


### leaveBreadcrumb(...)

```typescript
leaveBreadcrumb(options: LeaveBreadcrumbOptions) => Promise<void>
```

| Param         | Type                                                                      |
| ------------- | ------------------------------------------------------------------------- |
| **`options`** | <code><a href="#leavebreadcrumboptions">LeaveBreadcrumbOptions</a></code> |

--------------------


### setUserData(...)

```typescript
setUserData(options: SetUserDataOptions) => Promise<void>
```

| Param         | Type                                                              |
| ------------- | ----------------------------------------------------------------- |
| **`options`** | <code><a href="#setuserdataoptions">SetUserDataOptions</a></code> |

--------------------


### removeUserData(...)

```typescript
removeUserData(options: RemoveUserDataOptions) => Promise<void>
```

| Param         | Type                                                                    |
| ------------- | ----------------------------------------------------------------------- |
| **`options`** | <code><a href="#removeuserdataoptions">RemoveUserDataOptions</a></code> |

--------------------


### reportError(...)

```typescript
reportError(options: ReportErrorOptions) => Promise<void>
```

| Param         | Type                                                              |
| ------------- | ----------------------------------------------------------------- |
| **`options`** | <code><a href="#reporterroroptions">ReportErrorOptions</a></code> |

--------------------


### beginCall(...)

```typescript
beginCall(options: BeginCallOptions) => Promise<EndCallOptions>
```

| Param         | Type                                                          |
| ------------- | ------------------------------------------------------------- |
| **`options`** | <code><a href="#begincalloptions">BeginCallOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#endcalloptions">EndCallOptions</a>&gt;</code>

--------------------


### endCall(...)

```typescript
endCall(options: EndCallOptions) => Promise<void>
```

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code><a href="#endcalloptions">EndCallOptions</a></code> |

--------------------


### beginHttpRequest(...)

```typescript
beginHttpRequest(options: BeginHttpRequestOptions) => Promise<{ http_tracker: string; }>
```

| Param         | Type                                                                        |
| ------------- | --------------------------------------------------------------------------- |
| **`options`** | <code><a href="#beginhttprequestoptions">BeginHttpRequestOptions</a></code> |

**Returns:** <code>Promise&lt;{ http_tracker: string; }&gt;</code>

--------------------


### reportDone(...)

```typescript
reportDone(options: ReportDoneOptions) => Promise<void>
```

| Param         | Type                                                            |
| ------------- | --------------------------------------------------------------- |
| **`options`** | <code><a href="#reportdoneoptions">ReportDoneOptions</a></code> |

--------------------


### withResponseCode(...)

```typescript
withResponseCode(options: HttpTrackerResponseCodeOptions) => Promise<void>
```

| Param         | Type                                                                                      |
| ------------- | ----------------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#httptrackerresponsecodeoptions">HttpTrackerResponseCodeOptions</a></code> |

--------------------


### withResponseContentLength(...)

```typescript
withResponseContentLength(options: HttpTrackerContentLengthOptions) => Promise<void>
```

| Param         | Type                                                                                        |
| ------------- | ------------------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#httptrackercontentlengthoptions">HttpTrackerContentLengthOptions</a></code> |

--------------------


### withRequestContentLength(...)

```typescript
withRequestContentLength(options: HttpTrackerContentLengthOptions) => Promise<void>
```

| Param         | Type                                                                                        |
| ------------- | ------------------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#httptrackercontentlengthoptions">HttpTrackerContentLengthOptions</a></code> |

--------------------


### withResponseHeaderFields(...)

```typescript
withResponseHeaderFields(options: HttpTrackerHeaderOptions) => Promise<void>
```

| Param         | Type                                                                          |
| ------------- | ----------------------------------------------------------------------------- |
| **`options`** | <code><a href="#httptrackerheaderoptions">HttpTrackerHeaderOptions</a></code> |

--------------------


### withRequestHeaderFields(...)

```typescript
withRequestHeaderFields(options: HttpTrackerHeaderOptions) => Promise<void>
```

| Param         | Type                                                                          |
| ------------- | ----------------------------------------------------------------------------- |
| **`options`** | <code><a href="#httptrackerheaderoptions">HttpTrackerHeaderOptions</a></code> |

--------------------


### withInstrumentationSource(...)

```typescript
withInstrumentationSource(options: HttpTrackerInstrumentationSourceOptions) => Promise<void>
```

| Param         | Type                                                                                                        |
| ------------- | ----------------------------------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#httptrackerinstrumentationsourceoptions">HttpTrackerInstrumentationSourceOptions</a></code> |

--------------------


### withErrorMessage(...)

```typescript
withErrorMessage(options: HttpTrackerErrorMessageOptions) => Promise<void>
```

| Param         | Type                                                                                      |
| ------------- | ----------------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#httptrackererrormessageoptions">HttpTrackerErrorMessageOptions</a></code> |

--------------------


### getCorrelationHeaders()

```typescript
getCorrelationHeaders() => Promise<{ headers: Map<string, string>; }>
```

**Returns:** <code>Promise&lt;{ headers: <a href="#map">Map</a>&lt;string, string&gt;; }&gt;</code>

--------------------


### startNextSession()

```typescript
startNextSession() => Promise<void>
```

--------------------


### unblockScreenshots()

```typescript
unblockScreenshots() => Promise<void>
```

--------------------


### blockScreenshots()

```typescript
blockScreenshots() => Promise<void>
```

--------------------


### screenshotsBlocked()

```typescript
screenshotsBlocked() => Promise<{ screenshots_blocked: boolean; }>
```

**Returns:** <code>Promise&lt;{ screenshots_blocked: boolean; }&gt;</code>

--------------------


### takeScreenshot()

```typescript
takeScreenshot() => Promise<void>
```

--------------------


### startSessionFrame(...)

```typescript
startSessionFrame(options: StartSessionFrameOptions) => Promise<{ session_frame: string; }>
```

| Param         | Type                                                                          |
| ------------- | ----------------------------------------------------------------------------- |
| **`options`** | <code><a href="#startsessionframeoptions">StartSessionFrameOptions</a></code> |

**Returns:** <code>Promise&lt;{ session_frame: string; }&gt;</code>

--------------------


### endSessionFrame(...)

```typescript
endSessionFrame(options: EndSessionFrameOptions) => Promise<void>
```

| Param         | Type                                                                      |
| ------------- | ------------------------------------------------------------------------- |
| **`options`** | <code><a href="#endsessionframeoptions">EndSessionFrameOptions</a></code> |

--------------------


### updateSessionFrameName(...)

```typescript
updateSessionFrameName(options: UpdateSessionFrameOptions) => Promise<{ session_frame: string; }>
```

| Param         | Type                                                                            |
| ------------- | ------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#updatesessionframeoptions">UpdateSessionFrameOptions</a></code> |

**Returns:** <code>Promise&lt;{ session_frame: string; }&gt;</code>

--------------------


### getVersion()

```typescript
getVersion() => Promise<{ version: string; }>
```

**Returns:** <code>Promise&lt;{ version: string; }&gt;</code>

--------------------


### clear()

```typescript
clear() => Promise<void>
```

--------------------


### Interfaces


#### EchoOptions

| Prop        | Type                |
| ----------- | ------------------- |
| **`value`** | <code>string</code> |


#### StartTimerOptions

| Prop       | Type                |
| ---------- | ------------------- |
| **`name`** | <code>string</code> |


#### StopTimerOptions

| Prop       | Type                |
| ---------- | ------------------- |
| **`name`** | <code>string</code> |


#### ReportMetricWithNameOptions

| Prop        | Type                |
| ----------- | ------------------- |
| **`name`**  | <code>string</code> |
| **`value`** | <code>number</code> |


#### LeaveBreadcrumbOptions

| Prop       | Type                |
| ---------- | ------------------- |
| **`name`** | <code>string</code> |


#### SetUserDataOptions

| Prop        | Type                |
| ----------- | ------------------- |
| **`key`**   | <code>string</code> |
| **`value`** | <code>string</code> |


#### RemoveUserDataOptions

| Prop      | Type                |
| --------- | ------------------- |
| **`key`** | <code>string</code> |


#### ReportErrorOptions

| Prop                | Type                                                              |
| ------------------- | ----------------------------------------------------------------- |
| **`error`**         | <code>string</code>                                               |
| **`errorDomain`**   | <code>string</code>                                               |
| **`errorCode`**     | <code>number</code>                                               |
| **`errorStack`**    | <code>boolean</code>                                              |
| **`errorSeverity`** | <code><a href="#errorseveritylevel">ErrorSeverityLevel</a></code> |


#### EndCallOptions

| Prop               | Type                |
| ------------------ | ------------------- |
| **`call_tracker`** | <code>string</code> |


#### BeginCallOptions

| Prop                | Type                |
| ------------------- | ------------------- |
| **`className`**     | <code>string</code> |
| **`methodName`**    | <code>string</code> |
| **`withArguments`** | <code>[]</code>     |


#### BeginHttpRequestOptions

| Prop      | Type                |
| --------- | ------------------- |
| **`url`** | <code>string</code> |


#### ReportDoneOptions

| Prop               | Type                |
| ------------------ | ------------------- |
| **`http_tracker`** | <code>string</code> |


#### HttpTrackerResponseCodeOptions

| Prop               | Type                |
| ------------------ | ------------------- |
| **`http_tracker`** | <code>string</code> |
| **`status_code`**  | <code>string</code> |


#### HttpTrackerContentLengthOptions

| Prop                 | Type                |
| -------------------- | ------------------- |
| **`http_tracker`**   | <code>string</code> |
| **`content_length`** | <code>number</code> |


#### HttpTrackerHeaderOptions

| Prop               | Type                                                      |
| ------------------ | --------------------------------------------------------- |
| **`http_tracker`** | <code>string</code>                                       |
| **`http_headers`** | <code><a href="#map">Map</a>&lt;string, string&gt;</code> |


#### Map

| Prop       | Type                |
| ---------- | ------------------- |
| **`size`** | <code>number</code> |

| Method      | Signature                                                                                                      |
| ----------- | -------------------------------------------------------------------------------------------------------------- |
| **clear**   | () =&gt; void                                                                                                  |
| **delete**  | (key: K) =&gt; boolean                                                                                         |
| **forEach** | (callbackfn: (value: V, key: K, map: <a href="#map">Map</a>&lt;K, V&gt;) =&gt; void, thisArg?: any) =&gt; void |
| **get**     | (key: K) =&gt; V \| undefined                                                                                  |
| **has**     | (key: K) =&gt; boolean                                                                                         |
| **set**     | (key: K, value: V) =&gt; this                                                                                  |


#### HttpTrackerInstrumentationSourceOptions

| Prop                     | Type                |
| ------------------------ | ------------------- |
| **`http_tracker`**       | <code>string</code> |
| **`information_source`** | <code>string</code> |


#### HttpTrackerErrorMessageOptions

| Prop                | Type                |
| ------------------- | ------------------- |
| **`http_tracker`**  | <code>string</code> |
| **`error_message`** | <code>string</code> |


#### StartSessionFrameOptions

| Prop                     | Type                |
| ------------------------ | ------------------- |
| **`session_frame_name`** | <code>string</code> |


#### EndSessionFrameOptions

| Prop                | Type                |
| ------------------- | ------------------- |
| **`session_frame`** | <code>string</code> |


#### UpdateSessionFrameOptions

| Prop                     | Type                |
| ------------------------ | ------------------- |
| **`session_frame_name`** | <code>string</code> |
| **`session_frame`**      | <code>string</code> |


### Enums


#### ErrorSeverityLevel

| Members                  | Value          |
| ------------------------ | -------------- |
| **`errorLevelInfo`**     | <code>0</code> |
| **`errorLevelWarn`**     |                |
| **`errorLevelCritical`** |                |

</docgen-api>
