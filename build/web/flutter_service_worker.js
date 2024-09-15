'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5504f1bacaf1fbd76f2fe3cf233cc5dc",
"assets/AssetManifest.bin.json": "4cdd6259b8ad59346cfa34a6e3e2055a",
"assets/AssetManifest.json": "274adbda5bba7a5a5ee305018f33854c",
"assets/assets/images/1.jpg": "16bd9f10afbb1df044d1a9bb81069a92",
"assets/assets/images/10.jpg": "6cf9111e4492e7ec3526354be7e1a3aa",
"assets/assets/images/11.jpg": "2a6364659eac2b421788ef903bdc1d34",
"assets/assets/images/12.jpg": "7873ea7e3c862655f5e850788ce9c6e0",
"assets/assets/images/2.jpg": "3d05ee009e0b2203fb3b1a4ccedad987",
"assets/assets/images/3.jpg": "b036e2bc30f093fc66972fe187869bcc",
"assets/assets/images/4.jpg": "2b8e91db362870e4dc49511f1f90d6e4",
"assets/assets/images/5.jpg": "7ac0d4eadf7ba724858324ca24a75a2e",
"assets/assets/images/6.jpg": "1d4cde9602f27a15f5ecaa454fb14242",
"assets/assets/images/7.jpg": "6fe2a049a27e55d7514836198b55762d",
"assets/assets/images/8.jpg": "e7fdf8dc15ad8eafd6390e47379cda6c",
"assets/assets/images/9.jpg": "8dfc5fdbdd6948ff6cededbc8a4fdfd6",
"assets/assets/images/A.png": "7e97a58db6c9c1a03b38b53f449ef2b7",
"assets/assets/images/B.png": "1a78dd21d8c46f73bcebf769cd4c837f",
"assets/assets/images/E.png": "3021ea23f751084cc9e4b5aae18a9948",
"assets/assets/images/F.png": "c11064e71351d4f220f79c2be124e0ed",
"assets/assets/images/fb.png": "3d0ddc4485da120fdda9bd558bf99e0c",
"assets/assets/images/FF.png": "aeacd34a5be92133258f05653cfb429f",
"assets/assets/images/G.png": "1ed59251756a82909bb511ac816e97ac",
"assets/assets/images/instagram.png": "f8ba051f5e01376a4b560e110d0ea1be",
"assets/assets/images/k.jpg": "bfabc32f05355e66dd291645992b7db3",
"assets/assets/images/linked.jpg": "f8ebf8624c2fb9971272bf0613aadfa3",
"assets/assets/images/monge.jpg": "25e70bade4e8b8780a7e62b76b9bc2d5",
"assets/assets/images/twitter.png": "e9e9b57fcd9426977c9dd6ab6d7f0092",
"assets/assets/images/youtube.png": "acf68c38b8fb452fe033e36283b5829e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "910640f9665013d9709e9dd1533c4bbb",
"assets/NOTICES": "a210a21d3303150606ca2520978fbcd9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "da89c0982d27a44b1ca44ccefd8e15b6",
"/": "da89c0982d27a44b1ca44ccefd8e15b6",
"main.dart.js": "5de467615277480a05adb6dcbf748bc1",
"manifest.json": "baad5655037469813ff5b9bae5db135a",
"version.json": "e237d5b67958eb9780cd1044aae56d6f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
