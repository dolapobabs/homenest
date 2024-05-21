import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homenest/presentation/widgets/app_bar_map.dart';
import 'package:homenest/presentation/widgets/circle_icon.dart';
import 'package:homenest/utils/app_assets.dart';
import 'package:homenest/utils/extensions/text_theme.dart';
import 'package:homenest/utils/extensions/widget_marker.dart';

import '../widgets/popup_menu_button.dart';

const String darkstyle = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]''';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  LatLng currentLocation = const LatLng(6.605874, 3.349149); // Initial position
  final Set<Marker> _markers = {};
  LatLngBounds? _bounds;

  @override
  void initState() {
    // initMarkers();
    _generateRandomMarkers();
    super.initState();
  }

  Future<void> _generateRandomMarkers() async {
    try {
      final random = Random();
      const double delta = 0.07; // Define the delta for the scatter range

      for (int i = 0; i < 6; i++) {
        final double latOffset = (random.nextDouble() - 0.5) * delta;
        final double lngOffset = (random.nextDouble() - 0.5) * delta;
        final LatLng randomPoint = LatLng(
          currentLocation.latitude + latOffset,
          currentLocation.longitude + lngOffset,
        );

        _markers.add(Marker(
          markerId: MarkerId('marker_$i'),
          position: randomPoint,
          icon: await const AddressWidget().toBitmapDescriptor(
              logicalSize: const Size(50, 50), imageSize: const Size(100, 100)),
        ));
      }

      _bounds = _calculateBounds(_markers);
      if (!context.mounted) return;
      setState(() {});
    } catch (e) {}
  }

  LatLngBounds _calculateBounds(Set<Marker> markers) {
    final southwest = LatLng(
      markers.map((m) => m.position.latitude).reduce(min),
      markers.map((m) => m.position.longitude).reduce(min),
    );

    final northeast = LatLng(
      markers.map((m) => m.position.latitude).reduce(max),
      markers.map((m) => m.position.longitude).reduce(max),
    );

    return LatLngBounds(southwest: southwest, northeast: northeast);
  }

  final Future<bool> _mapFuture =
      Future.delayed(const Duration(milliseconds: 1000), () => true);
  bool isMapVisible = false;

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black87,
          systemNavigationBarContrastEnforced: true,
          systemStatusBarContrastEnforced: true),
      child: Container(
        color: Colors.black87,
        child: Stack(
          children: [
            Positioned.fill(
              child: FutureBuilder(
                  future: _mapFuture,
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      ));
                    }

                    return AnimatedOpacity(
                      curve: Curves.fastOutSlowIn,
                      opacity: isMapVisible ? 1.0 : 0,
                      duration: const Duration(milliseconds: 600),
                      child: GoogleMap(
                        zoomControlsEnabled: false,
                        style: darkstyle,
                        initialCameraPosition: CameraPosition(
                          target: currentLocation,
                          zoom: 13.0,
                        ),
                        markers: _markers,
                        onMapCreated: (controller) async {
                          _controller = controller;
                          if (_bounds != null) {
                            _controller?.animateCamera(
                                CameraUpdate.newLatLngBounds(_bounds!, 50));
                          }
                          Future.delayed(
                              const Duration(milliseconds: 550),
                              () => setState(() {
                                    isMapVisible = true;
                                  }));
                        },
                      ),
                    );
                  }),
            ),
            // Positioned.fill(
            //   child: GoogleMap(
            //     // mapType: MapType.normal,
            //     zoomControlsEnabled: false,
            //     style: darkstyle,
            //     initialCameraPosition: CameraPosition(
            //       target: currentLocation,
            //       zoom: 13.0,
            //     ),
            //     markers: _markers,
            //     onMapCreated: (GoogleMapController controller) {
            //       _controller = controller;
            //       if (_bounds != null) {
            //         _controller?.animateCamera(
            //             CameraUpdate.newLatLngBounds(_bounds!, 50));
            //       }
            //     },
            //   ),
            // ),
            Positioned(
                top: 40.h, // Adjust the position as needed
                left: 20.w,
                right: 20.w,
                child: const AppBarMap()),
            Positioned(
                bottom: 70.h,
                left: 20.w,
                child: Column(
                  children: [
                    CustomPopupMenuButton(
                      icon: SvgPicture.asset(
                        AppAssets.stack,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                      menuitems: [
                        MenuItem(name: 'Cozy areas', icon: AppAssets.shield),
                        MenuItem(name: 'Price', icon: AppAssets.wallet),
                        MenuItem(
                            name: 'Infrastructure',
                            icon: AppAssets.infrastructure),
                        MenuItem(
                            name: 'Without any layer', icon: AppAssets.stack),
                      ],
                    ),
                    10.verticalSpace,
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.3),
                      radius: 25,
                      child: IconButton(
                          icon: SvgPicture.asset(
                            AppAssets.send,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                )),
            Positioned(
                bottom: 70.h,
                right: 20.w,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    children: [
                      IconButton(
                          icon: SvgPicture.asset(
                            AppAssets.list,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                          onPressed: () {
                            // Show filter dialog
                          }),
                      const Text('List of Variants',
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 10)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orange.shade300,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(7.0),
          topRight: Radius.circular(7.0),
          bottomRight: Radius.circular(7.0),
        ),
      ),
      child: SvgPicture.asset(
        AppAssets.city,
      ),
    );
  }
}
