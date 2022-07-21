
VERSION = $(shell cat ./VERSION)
BUILD_NUMBER = $(shell cat ./BUILDNUMBER)
BUILD_NUMBER_FILE=BUILDNUMBER
BUILD_NUMBER_LIVE = $(shell cat ./BUILDNUMBER_LIVE)
BUILD_NUMBER_LIVE_FILE=BUILDNUMBER_LIVE

incrementbuild: 
	@if ! test -f $(BUILD_NUMBER_FILE); then echo 0 > $(BUILD_NUMBER_FILE); fi
	@@echo $$(($(BUILD_NUMBER)+1)) > $(BUILD_NUMBER_FILE)

incrementbuild-live: 
	@if ! test -f $(BUILD_NUMBER_LIVE_FILE); then echo 0 > $(BUILD_NUMBER_LIVE_FILE); fi
	@@echo $$(($(BUILD_NUMBER_LIVE)+1)) > $(BUILD_NUMBER_LIVE_FILE)

release-ios:
	make incrementbuild
	flutter clean
	flutter build ios --release  --build-name=$(VERSION) --build-number=$(BUILD_NUMBER)
	cd ios/ && bundle install && bundle exec fastlane beta --verbose

release-dev:
	cp .env.dev .env
	make incrementbuild
	flutter clean
	flutter build apk --release --build-name=$(VERSION) --build-number=$(BUILD_NUMBER) --flavor development --target lib/main_development.dart
	firebase appdistribution:distribute build/app/outputs/flutter-apk/app-development-release.apk  \
		--app 1:640044989417:android:faadc1903ae121ff5e6978  \
		--groups "dev" \
		--release-notes-file "changelog.txt" 

release-dev-aab:
	cp .env.dev .env
	make incrementbuild
	flutter clean
	flutter build appbundle --release --build-name=$(VERSION) --build-number=$(BUILD_NUMBER) --flavor development --target lib/main_development.dart
	firebase appdistribution:distribute build/app/outputs/bundle/release/app-development-release.aab  \
		--app 1:640044989417:android:faadc1903ae121ff5e6978  \
		--groups "dev" \
		--release-notes-file "changelog.txt" 

release-staging:
	cp .env.staging .env
	make incrementbuild
	flutter clean
	flutter build apk --release --build-name=$(VERSION) --build-number=$(BUILD_NUMBER) --flavor staging --target lib/main_staging.dart
	firebase appdistribution:distribute build/app/outputs/flutter-apk/app-staging-release.apk  \
		--app 1:640044989417:android:4738c4333af706655e6978  \
		--groups "uat" \
		--release-notes-file "changelog.txt" 

release-staging-aab:
	cp .env.staging .env
	make incrementbuild
	flutter clean
	flutter build appbundle --release --build-name=$(VERSION) --build-number=$(BUILD_NUMBER) --flavor staging --target lib/main_staging.dart
	firebase appdistribution:distribute build/app/outputs/bundle/release/app-staging-release.aab  \
		--app 1:640044989417:android:4738c4333af706655e6978  \
		--groups "uat" \
		--release-notes-file "changelog.txt" 

release-live:
	cp .env.live .env
	make incrementbuild-live
	flutter clean
	flutter build apk --release --build-name=$(VERSION) --build-number=$(BUILD_NUMBER_LIVE) --flavor production --target lib/main_production.dart
	firebase appdistribution:distribute build/app/outputs/flutter-apk/app-production-release.apk  \
		--app 1:640044989417:android:6f15f33b383015215e6978  \
		--groups "live" \
		--release-notes-file "changelog.txt" 

release-live-aab:
	cp .env.live .env
	make incrementbuild-live
	flutter clean
	flutter build appbundle --release --build-name=$(VERSION) --build-number=$(BUILD_NUMBER_LIVE) --flavor production lib/main_production.dart
	firebase appdistribution:distribute build/app/outputs/bundle/release/app-production-release.aab  \
		--app 1:640044989417:android:6f15f33b383015215e6978  \
		--groups "live" \
		--release-notes-file "changelog.txt" 

test-staging:
	cp .env.staging .env
	flutter clean
	flutter build apk --release --build-name=$(VERSION) --build-number=$(BUILD_NUMBER) --flavor production lib/main_staging.dart  --obfuscate --split-debug-info=./mobile_android_staging

test-live:
	cp .env.live .env
	flutter clean
	flutter build apk --release --build-name=$(VERSION) --build-number=$(BUILD_NUMBER_LIVE) --flavor production lib/main_production.dart --obfuscate --split-debug-info=./mobile_android_live

test-live-aab:
	cp .env.live .env
	flutter clean
	flutter build appbundle --release --build-name=$(VERSION) --build-number=$(BUILD_NUMBER_LIVE) --flavor production lib/main_production.dart  --obfuscate --split-debug-info=./mobile_android_live
