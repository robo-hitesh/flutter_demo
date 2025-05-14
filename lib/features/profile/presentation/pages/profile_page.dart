import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment/core/utils/injection.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_event.dart';
import 'package:flutter_assignment/features/profile/presentation/bloc/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileBloc = getIt<ProfileBloc>();

  @override
  void initState() {
    super.initState();
    _profileBloc.add(ProfileFetchEvent("1"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _profileBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile", style: TextStyle(color: Colors.white)),
          centerTitle: false,
          backgroundColor: Colors.teal,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileSuccessState) {
              final profile = state.profile;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'https://robohash.org/mail@ashallendesign.co.uk',
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${profile.name.firstname} ${profile.name.lastname}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        profile.email,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Divider(thickness: 1),
                      const SizedBox(height: 16),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.phone, color: Colors.teal),
                          title: const Text("Phone"),
                          subtitle: Text(profile.phone),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.location_on,
                            color: Colors.teal,
                          ),
                          title: const Text("Address"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Street: ${profile.address.street}'),
                              Text('City: ${profile.address.city}'),
                              Text('Zipcode: ${profile.address.zipcode}'),
                              Text(
                                'Latitude: ${profile.address.geolocation.lat}',
                              ),
                              Text(
                                'Longitude: ${profile.address.geolocation.long}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ProfileErrorState) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            } else {
              return const Center(child: Text("No data available"));
            }
          },
        ),
      ),
    );
  }
}
