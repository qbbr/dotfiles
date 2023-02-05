// put to ff profile dir (about:support / about:profiles)

user_pref("general.buildID.override", "20100101");
user_pref("browser.startup.homepage_override.buildID", "20100101");
// Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36
// Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0
user_pref("general.useragent.override", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36");
// ^^^ detected is "Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0" - OK

// dark mode
//user_pref("browser.in-content.dark-mode", true);
//user_pref("ui.systemUsesDarkTheme", 1);
//user_pref("layout.css.prefers-color-scheme.content-override", 0);

user_pref("dom.serviceWorkers.enabled", false);
user_pref("dom.webnotifications.enabled", false);
user_pref("dom.enable_performance", false);
user_pref("dom.enable_user_timing", false);
user_pref("dom.performance.enable_user_timing_logging", false);
user_pref("dom.enable_resource_timing", false);
user_pref("dom.battery.enabled", false);
user_pref("dom.telephony.enabled", false);
user_pref("dom.gamepad.enabled", false);
user_pref("dom.vr.enabled", false);
user_pref("dom.vibrator.enabled", false);
user_pref("dom.archivereader.enabled", false);
user_pref("dom.flyweb.enabled", false);
user_pref("dom.mozTCPSocket.enabled", false);
user_pref("dom.netinfo.enabled", false);
user_pref("dom.network.enabled", false);
user_pref("dom.maxHardwareConcurrency", 2);

user_pref("accessibility.force_disabled", 1);

user_pref("app.update.auto", false);
user_pref("browser.search.update", false);
user_pref("loop.enabled", false);
user_pref("loop.logDomains", false);
user_pref("pdfjs.disabled", true);
user_pref("browser.pocket.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("browser.uitour.enabled", false);
user_pref("camera.control.face_detection.enabled", false);
user_pref("webgl.disabled", true);
user_pref("webgl.disable-extension", true);
user_pref("webgl.min_capability_mode", true);
user_pref("webgl.enable-debug-renderer-info", false);
user_pref("network.proxy.socks_remote_dns", true);
user_pref("network.manage-offline-status", false);
user_pref("network.jar.open-unsafe-types", false);
user_pref("beacon.enabled", false);
user_pref("browser.send_pings", false);
user_pref("browser.urlbar.trimURLs", false);
user_pref("browser.fixup.alternate.enabled", false);
user_pref("media.peerconnection.enabled", false);
user_pref("media.navigator.enabled", false);
user_pref("media.navigator.video.enabled", false);
user_pref("media.getusermedia.screensharing.enabled", false);
user_pref("media.getusermedia.audiocapture.enabled", false);
user_pref("media.webspeech.recognition.enable", false);
user_pref("media.webspeech.synth.enabled", false);
user_pref("media.video_stats.enabled", false);
user_pref("media.gmp-gmpopenh264.enabled", false);
user_pref("media.gmp-manager.url", "");
user_pref("device.sensors.enabled", false);
user_pref("javascript.options.wasm", false);
user_pref("javascript.options.asmjs", false);

user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
user_pref("privacy.userContext.enabled", true);
// todo: resistFingerprinting - reset full screen and dark mode
//user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.firstparty.isolate", true);

user_pref("plugins.click_to_play", true);

user_pref("geo.enabled", false);
user_pref("geo.wifi.logging.enabled", false);

user_pref("security.mixed_content.block_active_content", true);
user_pref("security.mixed_content.block_display_content", true);
user_pref("security.xpconnect.plugin.unrestricted", false);

user_pref("extensions.getAddons.cache.enabled", false);
user_pref("extensions.update.enabled", false);
user_pref("extensions.systemAddon.update.enabled", false);
user_pref("lightweightThemes.update.enabled", false);
user_pref("plugin.state.flash", 0);
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);
user_pref("dom.ipc.plugins.reportCrashURL", false);
user_pref("plugin.state.java", 0);
user_pref("plugin.state.libgnome-shell-browser-plugin", 0);
user_pref("shumway.disabled", true);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.enabled", false);

user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("experiments.supported", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
user_pref("network.allow-experiments", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.selfsupport.url", "");
user_pref("browser.urlbar.filter.javascript", true);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.pagethumbnails.capturing_disabled", true);
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtabpage.enhanced", false);
user_pref("browser.newtab.preload", false);
user_pref("browser.newtabpage.directory.ping", "");
user_pref("browser.newtabpage.directory.source", "data:text/plain,{}");
user_pref("browser.newtab.url", "about:blank");

user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.predictor.enabled", false);
user_pref("network.dns.blockDotOnion", true);
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("network.captive-portal-service.enabled", false);
user_pref("browser.aboutHomeSnippets.updateUrl", "");
user_pref("browser.casting.enabled", false);
user_pref("network.cookie.cookieBehavior", 1);
user_pref("network.cookie.thirdparty.sessionOnly", true);
//user_pref("network.IDN_show_punycode", true);

user_pref("signon.rememberSignons", false);

user_pref("general.smoothScroll", false);
user_pref("toolkit.cosmeticAnimations.enabled", false);

user_pref("network.stricttransportsecurity.preloadlist", true);
user_pref("security.OCSP.enabled", 1);
user_pref("security.ssl.enable_ocsp_stapling", true);
user_pref("security.ssl.enable_ocsp_must_staple", true);
//user_pref("security.OCSP.require", true);

// do not load tabs on startup
user_pref("browser.sessionstore.restore_on_demand", true);
user_pref("browser.sessionstore.restore_pinned_tabs_on_demand", true);

// disable ctrl+q
user_pref("browser.quitShortcut.disabled", true);
