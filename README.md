# Monitor
 This is a crude, cobbled-together Electron app for monitoring video and audio inputs on macOS. It could probably be ported to Windows or linux if you really wanted to. My long term goal is to get rid of Electron and make the whole thing a PWA so it'll work on Chrome OS as well, but we don't live in that world yet.
 
 The use case is to take a video and audio input from a camera or capture device, and display the video in a window while playing the audio through to the default output. In this way, you can turn your $5000 MacBook Pro into a $200 BVM, and (for example) play games from a nearby PlayStation through a capture device onto your Mac monitor (Mac Gaming 2020!).
 
 For a variety of reasons, this isn't a trivial thing to do on modern computers, and the existing apps were all janky in various ways. There are native APIs to do all of these things, of course, but they were strangely laggy and kept dropping frames. It's a measure of how horrifying modern software development has come that web APIs that aren't native to any platform wildly outperform those you can call from C.
 
 The irony of a 170MB app bundle to replace what was 65kB of native code is not lost on me, and it's only with a deep sense of shame and regret that I publish this repository at all.

## Known issues
* Resolutions higher than 1080p are not currently supported.
* On a Mac, the application bundle must live in /Applications and cannot be renamed. I know, I'm sorry. The Mac version of Electron doesn't handle relative paths very well.
* Even with a good HDMI capture device, there's still 20-30ms of latency, so depending on what you want to do, this might be a problem.
* The Mac default gamma settings are wildly different to most TVs, which can make the monitored video look dark and gloomy. There are filters that could fix this but it's highly subjective and adds more latency.
* There's no audio feedback protection because it introduces too much latency, and the system default inputs are monitored when the app first loads. Temporarily mute either your input or your output if you're using this in a noisy environment, otherwise you will make bystanders very angry.
* The included build script only produces debug builds and a release build needs additional assets copied into the bundle before it will run.
* The included app bundle is more of a proof of concept and is not signed or notarised. By the time you read this, Apple will no doubt require you to scale a distant mountain peak and genuflect before an ancient shrine before being permitted to run it.