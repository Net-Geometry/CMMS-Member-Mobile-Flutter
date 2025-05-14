import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class NearMePage extends StatefulWidget {
  const NearMePage({super.key});

  @override
  State<NearMePage> createState() => _NearMePageState();
}

class _NearMePageState extends State<NearMePage> {
  final Completer<GoogleMapController> _mapController = Completer();
  Position? _currentPosition;
  String _selectedFilter = 'All Locations';

  final List<String> _filters = [
    'All Locations',
    'Nearest',
    'Popular',
    'Recent',
  ];

  // Example data — in real use, fetch from Supabase
  final List<_Center> _centers = [
    _Center(
      name: 'NADI Kampung Bukit Cerakah',
      address: '123 Gaming Street, Level 2',
      distanceKm: 0.5,
      hours: 'Open until 11 PM',
      position: LatLng(3.123, 101.567),
    ),
    _Center(
      name: 'NADI Kampung Beruas',
      address: '456 Tournament Plaza',
      distanceKm: 15.2,
      hours: 'Open 24/7',
      position: LatLng(3.130, 101.580),
    ),
    // add more...
  ];

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() => _currentPosition = pos);

    final controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(pos.latitude, pos.longitude), 14));
  }

  Set<Marker> get _markers {
    final m = <Marker>{};
    for (var c in _centers) {
      m.add(
        Marker(
          markerId: MarkerId(c.name),
          position: c.position,
          infoWindow: InfoWindow(title: c.name, snippet: c.address),
        ),
      );
    }
    if (_currentPosition != null) {
      m.add(Marker(
        markerId: const MarkerId('me'),
        position:
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        infoWindow: const InfoWindow(title: 'You'),
      ));
    }
    return m;
  }

  List<_Center> get _filteredCenters {
    switch (_selectedFilter) {
      case 'Nearest':
        final list = List.of(_centers)
          ..sort((a, b) => a.distanceKm.compareTo(b.distanceKm));
        return list;
      case 'Popular':
        return _centers; // implement popularity sorting
      case 'Recent':
        return _centers; // implement recent filter
      case 'All Locations':
      default:
        return _centers;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NADI Locations'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(_currentPosition!.latitude,
                        _currentPosition!.longitude),
                    zoom: 14,
                  ),
                  myLocationEnabled: true,
                  markers: _markers,
                  onMapCreated: (c) => _mapController.complete(c),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.35,
                  minChildSize: 0.15,
                  maxChildSize: 0.75,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, -2)),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Filter tabs
                          SizedBox(
                            height: 36,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, idx) {
                                final f = _filters[idx];
                                final isSel = f == _selectedFilter;
                                return GestureDetector(
                                  onTap: () => setState(() {
                                    _selectedFilter = f;
                                  }),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 16),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: isSel
                                          ? const Color(0xFF5F26B4)
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      f.replaceAll('Locations', '').trim(),
                                      style: TextStyle(
                                        color: isSel ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (_, __) => const SizedBox(width: 8),
                              itemCount: _filters.length,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              controller: scrollController,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: _filteredCenters.length,
                              itemBuilder: (context, i) {
                                final c = _filteredCenters[i];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: ListTile(
                                    title: Text(c.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(c.address),
                                        const SizedBox(height: 4),
                                        Text(c.hours,
                                            style:
                                                const TextStyle(color: Colors.black54)),
                                      ],
                                    ),
                                    trailing: Text(
                                      '${c.distanceKm.toStringAsFixed(1)} km',
                                      style: TextStyle(
                                          color: const Color(0xFF5F26B4),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onTap: () {
                                      // open directions
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}

/// Simple model for a center
class _Center {
  final String name, address, hours;
  final double distanceKm;
  final LatLng position;

  _Center({
    required this.name,
    required this.address,
    required this.hours,
    required this.distanceKm,
    required this.position,
  });
}