/// <reference types="@capacitor/cli" />
export interface ADEUMMobileCapacitorPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  getVersion(): Promise<{ version: string }>;
  onReset(): void;
}
declare module '@capacitor/cli' {
  export interface PluginsConfig {
    ADEUMMobileCapacitorPlugin?: {
      ADEUM_APP_KEY: String;
            ADEUM_COLLECTOR_URL: 'http://account.appdynamics.com',
: String;
      screenshotUrl: String;
      screenshotsEnabled: Boolean;
      loggingLevel: String;
      reachabilityHost: String;
      interactionCaptureMode: String;
    };
  }
}
