'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "609fbcc62145927c59f89dc1bfd658c4",
"assets/assets/fonts/inter/Inter-Black.ttf": "c6dacb6bcfcd747bba440bf2fbd2c85a",
"assets/assets/fonts/inter/Inter-Bold.ttf": "cef517a165e8157d9f14a0911190948d",
"assets/assets/fonts/inter/Inter-Light.ttf": "d4be01c95657978131342b1dcf829a45",
"assets/assets/fonts/inter/Inter-Medium.ttf": "1aa99aa25c72307cb7f16fae35e8c9d1",
"assets/assets/fonts/inter/Inter-Regular.ttf": "eba360005eef21ac6807e45dc8422042",
"assets/assets/fonts/inter/Inter-SemiBold.ttf": "3e87064b7567bef4ecd2ba977ce028bc",
"assets/assets/images/png/denvau.png": "ae3723d3abf1c9e9c61286790faea761",
"assets/assets/images/png/home_package.png": "b4b29a9bd7da284637f9c608877844d5",
"assets/assets/images/png/language_en.png": "0fc3b58a5bf8c9e773da2bf6509a38a7",
"assets/assets/images/png/language_vi.png": "f342044d72cfcea69e84877554789410",
"assets/assets/images/svg/dashboard_action.svg": "77971d15c5bee474e4e1c74558d01578",
"assets/assets/images/svg/dashboard_clone.svg": "0ccd8d969f520cea7f6c21e387b3cd77",
"assets/assets/images/svg/dashboard_clone_setting.svg": "51cc522fc891c46e2a2496884a8091dc",
"assets/assets/images/svg/dashboard_close.svg": "0af44088c7a86cd5fd6f71496f7bb273",
"assets/assets/images/svg/dashboard_device.svg": "06ca7eb0965f60ec7445c231dc742327",
"assets/assets/images/svg/dashboard_finance.svg": "cbceb8041d99c5746cf61c566685ead6",
"assets/assets/images/svg/dashboard_friend.svg": "b6b3a0a42d694151873a79a207233dfb",
"assets/assets/images/svg/dashboard_gift_code.svg": "410c902eb3a8bf2e9e7e92d8e80d30cc",
"assets/assets/images/svg/dashboard_group.svg": "2b53e6027824e330ac722c9b4a6ba463",
"assets/assets/images/svg/dashboard_home.svg": "0d2a35909b28c98f54d74487ec74f6e0",
"assets/assets/images/svg/dashboard_logout.svg": "65b4727c572667f63a04dd503bb6f838",
"assets/assets/images/svg/dashboard_money.svg": "7af407ef4a692a453d31e2e9467f3474",
"assets/assets/images/svg/dashboard_page.svg": "b36048bfbbab5457a6ff2fecbadd1ed1",
"assets/assets/images/svg/dashboard_profile.svg": "622a754db33581107ee1b850b3fd2af1",
"assets/assets/images/svg/dashboard_support.svg": "e48c91540b707968daa9ed136809d1a3",
"assets/assets/images/svg/home_delete.svg": "0af44088c7a86cd5fd6f71496f7bb273",
"assets/assets/images/svg/logo_app.svg": "fc51fc583ccb211fda68d3771ca7dc2d",
"assets/FontManifest.json": "7e4f16812f580b506cd73b2e7e78b1f9",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "7a954449a04de209a798f6a18442fab1",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "27d701584a1db85048f37dd5cd25d76c",
"/": "27d701584a1db85048f37dd5cd25d76c",
"main.dart.js": "e82b54863c8cae3ae2bfb8e7e41bd489",
"manifest.json": "4734db19b089f1a4d7b37fdc9824bcd2",
"version.json": "322dfa94430cc69aa45ce83495f46466"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
