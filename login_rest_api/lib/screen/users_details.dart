import 'package:flutter/material.dart';
import 'package:login_rest_api/services/user_services.dart';
import '../models/user_model.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  List<UsersModel>? usersModel;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    usersModel = await UserServices().getUsers();
    if (usersModel != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: usersModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: usersModel!.length,
                itemBuilder: (context, index) {
                  return UserCard(user: usersModel![index]);
                },
              ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final UsersModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('UserId: ${user.id}'),
              const SizedBox(width: 50),
              UserInfoColumn(user: user),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoColumn extends StatelessWidget {
  final UsersModel user;

  const UserInfoColumn({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name: ${user.name}'),
        Text('Email: ${user.email}'),
        Text('Username: ${user.username}'),
        Text('Phone: ${user.phone}'),
        Text('Website: ${user.website}'),
        const SizedBox(height: 10),
        AddressSection(address: user.address),
        const SizedBox(height: 10),
        GeoSection(geo: user.address.geo),
        const SizedBox(height: 10),
        CompanySection(company: user.company),
        const SizedBox(height: 20),
      ],
    );
  }
}

class AddressSection extends StatelessWidget {
  final Address address;

  const AddressSection({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Address:'),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('City: ${address.city}'),
            Text('Street: ${address.street}'),
            Text('Suite: ${address.suite}'),
          ],
        ),
      ],
    );
  }
}

class GeoSection extends StatelessWidget {
  final Geo geo;

  const GeoSection({super.key, required this.geo});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Geolocation:'),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Latitude: ${geo.lat}'),
            Text('Longitude: ${geo.lng}'),
          ],
        ),
      ],
    );
  }
}

class CompanySection extends StatelessWidget {
  final Company company;

  const CompanySection({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Company:'),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${company.name}'),
            Text('BS: ${company.bs}'),
            Text('Catch Phrase: ${company.catchPhrase}'),
          ],
        ),
      ],
    );
  }
}
