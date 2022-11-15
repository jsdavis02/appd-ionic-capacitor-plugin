import { WebPlugin } from '@capacitor/core';
import { v4 as uuid } from 'uuid';

import type {
  ADEUMMobileCapacitorPluginPlugin,
  BeginCallOptions,
  BeginHttpRequestOptions,
  EchoOptions,
  EndCallOptions,
  EndSessionFrameOptions,
  HttpTrackerContentLengthOptions,
  HttpTrackerErrorMessageOptions,
  HttpTrackerHeaderOptions,
  HttpTrackerInstrumentationSourceOptions,
  HttpTrackerResponseCodeOptions,
  LeaveBreadcrumbOptions,
  RemoveUserDataOptions,
  ReportDoneOptions,
  ReportErrorOptions,
  ReportMetricWithNameOptions,
  SetUserDataOptions,
  StartSessionFrameOptions,
  StartTimerOptions,
  UpdateSessionFrameOptions,
} from './definitions';

export class ADEUMMobileCapacitorPluginWeb
  extends WebPlugin
  implements ADEUMMobileCapacitorPluginPlugin {
  constructor() {
    super();
  }
  async echo(options: EchoOptions): Promise<EchoOptions> {
    console.log('ECHO', options);
    return options;
  }

  async startTimer(options: StartTimerOptions): Promise<void> {
    console.log('startTimer', options);
    return;
  }
  async stopTimer(options: StartTimerOptions): Promise<void> {
    console.log('stopTimer', options);
    return;
  }
  async reportMetricWithName(
    options: ReportMetricWithNameOptions,
  ): Promise<void> {
    console.log('reportMetricWithName', options);
    return;
  }
  async leaveBreadcrumb(options: LeaveBreadcrumbOptions): Promise<void> {
    console.log('leaveBreadcrumb', options);
    return;
  }
  async setUserData(options: SetUserDataOptions): Promise<void> {
    console.log('setUserData', options);
    return;
  }
  async removeUserData(options: RemoveUserDataOptions): Promise<void> {
    console.log('removeUserData', options);
    return;
  }

  async reportError(options: ReportErrorOptions): Promise<void> {
    console.log('reportError', options);
    return;
  }

  async beginCall(
    options: BeginCallOptions,
  ): Promise<{ call_tracker: string }> {
    console.log('beginCall', options);
    return { call_tracker: uuid() };
  }
  async endCall(options: EndCallOptions): Promise<void> {
    console.log('endCall', options);
    return;
  }
  async beginHttpRequest(
    options: BeginHttpRequestOptions,
  ): Promise<{ http_tracker: string }> {
    console.log('beginHttpRequest', options);
    return { http_tracker: uuid() };
  }
  async reportDone(options: ReportDoneOptions): Promise<void> {
    console.log('reportDone', options);
    return;
  }
  async withResponseCode(
    options: HttpTrackerResponseCodeOptions,
  ): Promise<void> {
    console.log('withResponseCode', options);
    return;
  }
  async withResponseContentLength(
    options: HttpTrackerContentLengthOptions,
  ): Promise<void> {
    console.log('withResponseContentLength', options);
    return;
  }
  async withRequestContentLength(
    options: HttpTrackerContentLengthOptions,
  ): Promise<void> {
    console.log('withRequestContentLength', options);
    return;
  }
  async withResponseHeaderFields(
    options: HttpTrackerHeaderOptions,
  ): Promise<void> {
    console.log('withResponseHeaderFields', options);
    return;
  }
  async withRequestHeaderFields(
    options: HttpTrackerHeaderOptions,
  ): Promise<void> {
    console.log('withRequestHeaderFields', options);
    return;
  }
  async withInstrumentationSource(
    options: HttpTrackerInstrumentationSourceOptions,
  ): Promise<void> {
    console.log('withInstrumentationSource', options);
    return;
  }
  async withErrorMessage(
    options: HttpTrackerErrorMessageOptions,
  ): Promise<void> {
    console.log('withErrorMessage', options);
    return;
  }
  async getCorrelationHeaders(): Promise<{ headers: Map<string, string> }> {
    console.log('getCorrelationHeaders');
    return { headers: new Map() };
  }
  async startNextSession(): Promise<void> {
    console.log('startNextSession');
    return;
  }
  async unblockScreenshots(): Promise<void> {
    console.log('unblockScreenshots');
    return;
  }
  async blockScreenshots(): Promise<void> {
    console.log('blockScreenshots');
    return;
  }
  async screenshotsBlocked(): Promise<{ screenshots_blocked: boolean }> {
    console.log('screenshotsBlocked');
    return { screenshots_blocked: false };
  }
  async takeScreenshot(): Promise<void> {
    console.log('takeScreenshot');
    return;
  }
  async startSessionFrame(
    options: StartSessionFrameOptions,
  ): Promise<{ session_frame: string }> {
    console.log('should be running');
    console.log('startSessionFrame', options);
    return { session_frame: uuid() };
  }
  async endSessionFrame(options: EndSessionFrameOptions): Promise<void> {
    console.log('endSessionFrame', options);
    return;
  }
  async updateSessionFrameName(
    options: UpdateSessionFrameOptions,
  ): Promise<{ session_frame: string }> {
    console.log('updateSessionFrameName', options);
    return { session_frame: options.session_frame };
  }
  async getVersion(): Promise<{ version: string }> {
    console.log('getVersion: 1.1.1');
    return { version: '1.1.1' };
  }
  async clear(): Promise<void> {
    console.log('clear');
    return;
  }
}
