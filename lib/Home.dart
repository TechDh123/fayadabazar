
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _currentCity = "Fetching location...";
  List<String> _gujaratCities = [
    'Ahmedabad',
    'Surat',
    'Vadodara',
    'Rajkot',
    'Gandhinagar'
  ];

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    ;
  }

  Future<void> requestLocationPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.camera,
      Permission.microphone,
      Permission.storage,
    ].request();
    if (statuses[Permission.location]!.isGranted) {
      print('Location permission granted');
    } else if (statuses[Permission.location]!.isDenied) {
      print('Location permission denied');
    } else if (statuses[Permission.location]!.isPermanentlyDenied) {
      print('Location permission permanently denied');
      await openAppSettings();
    }

    if (statuses[Permission.camera]!.isGranted) {
      print('Camera permission granted');
    } else if (statuses[Permission.camera]!.isDenied) {
      print('Camera permission denied');
    } else if (statuses[Permission.camera]!.isPermanentlyDenied) {
      print('Camera permission permanently denied');
      await openAppSettings();
    }

    if (statuses[Permission.microphone]!.isGranted) {
      print('Microphone permission granted');
    } else if (statuses[Permission.microphone]!.isDenied) {
      print('Microphone permission denied');
    } else if (statuses[Permission.microphone]!.isPermanentlyDenied) {
      print('Microphone permission permanently denied');
      await openAppSettings();
    }

    if (statuses[Permission.storage]!.isGranted) {
      print('Storage permission granted');
    } else if (statuses[Permission.storage]!.isDenied) {
      print('Storage permission denied');
    } else if (statuses[Permission.storage]!.isPermanentlyDenied) {
      print('Storage permission permanently denied');
      await openAppSettings();
    }

    setState(() {});
  }


  bool showAdContainer = true;
  bool _isDialogShowing = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String, String>> imageList = [
    {"id": "1", "image_path": 'assets/images/26.png'},
    {"id": "2", "image_path": 'assets/images/26.png'},
    {"id": "3", "image_path": 'assets/images/26.png'},
    {"id": "4", "image_path": 'assets/images/26.png'},
    {"id": "5", "image_path": 'assets/images/26.png'},
  ];

  final CarouselSliderController carouselController =
  CarouselSliderController();
  int currentIndex = 0;

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Logout FB APP?",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
          content: const Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(
                //     builder: (context) => const Login(),
                //   ),
                //       (route) => false,
                // );
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    if (!_isDialogShowing) {
      _isDialogShowing = true;
      bool? confirmExit = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text(
            'Exit FB App?',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
          content: const Text(
            'Are you sure you want to exit?',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _isDialogShowing = false;
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                _isDialogShowing = false;
                Navigator.of(context).pop(true);
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
      return confirmExit ?? false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          title: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Fayda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text: 'bazar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.blue, size: 30),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Searchpage()));
              },
            ),
            IconButton(
              icon:
              const Icon(Icons.notifications, color: Colors.blue, size: 30),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.deepOrange,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.orange,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.camera_alt,
                                size: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                        child: Text(
                          "Faydabazar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ))
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Dashboard'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.inventory),
                title: const Text('Bill Payment & Recharge'),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => BillPayment()));
                },
              ),
              ExpansionTile(
                leading: const Icon(Icons.person),
                title: const Text('My Members'),
                trailing: const Icon(Icons.arrow_forward_ios),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.how_to_reg_outlined),
                    title: const Text(
                      'Member Registration',
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MemberMaster()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.dashboard_outlined),
                    title: const Text(
                      'Member Downline',
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MemberDownline()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.insert_drive_file),
                    title: const Text(
                      'Upload KYC',
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => KYCDocuments()));
                    },
                  ),
                ],
                onExpansionChanged: (bool expanded) {},
              ),
              ExpansionTile(
                leading: const Icon(Icons.person),
                title: const Text('My Profile'),
                trailing: const Icon(Icons.arrow_forward_ios),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.change_circle),
                    title: const Text('Edit My Profile',
                        style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EditProfile()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.dashboard_outlined),
                    title: const Text('Change My Password',
                        style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ChangeMyPassword()));
                    },
                  ),
                  ExpansionTile(
                    leading: const Icon(Icons.insert_drive_file),
                    title: const Text('My Bank Accounts',
                        style: TextStyle(fontSize: 14)),
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.account_balance_wallet),
                        title: const Text('List Bank Accounts',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.account_balance),
                        title: const Text('Manage Bank',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {},
                      ),
                    ],
                  ),
                  ListTile(
                    leading: const Icon(Icons.details),
                    title: const Text('View My Details',
                        style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_balance),
                    title: const Text('Change Transaction Pass',
                        style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             ChangeTransactionPassword()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_balance),
                    title: const Text('Welcome Letter',
                        style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {},
                  ),
                ],
                onExpansionChanged: (bool expanded) {},
              ),
              ExpansionTile(
                leading: const Icon(Icons.system_security_update),
                title: const Text('Wallet System'),
                trailing: const Icon(Icons.arrow_forward_ios),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.wallet),
                    title: const Text(
                      'E-Wallet Summary',
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EWalletTransaction()));
                    },
                  ),
                  ExpansionTile(
                    leading: const Icon(Icons.request_page_sharp),
                    title: const Text('Fund Request',
                        style: TextStyle(fontSize: 14)),
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.add_chart),
                        title: const Text('Add Fund Request',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {
                          // Handle tap on "Add Bank Account"
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.list_alt_sharp),
                        title: const Text('List Fund Request',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SendFundRequest()));
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading:
                    const Icon(Icons.transfer_within_a_station_rounded),
                    title: const Text('Fund Transfer',
                        style: TextStyle(fontSize: 14)),
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.wallet_membership_sharp),
                        title: const Text('E-Wallet to SWallet',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => EWalletToSWallet()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.wallet_travel_outlined),
                        title: const Text('S-Wallet to SWallet',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SWalletToSWallet()));
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    leading: const Icon(Icons.insert_drive_file),
                    title: const Text(
                      'S-Wallet Summary',
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {},
                  ),
                  ExpansionTile(
                    leading: const Icon(Icons.cases_sharp),
                    title: const Text('Cash WithDrawal',
                        style: TextStyle(fontSize: 14)),
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.wallet_membership_sharp),
                        title: const Text('E-Wallet to SWallet',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {

                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.wallet_travel_outlined),
                        title: const Text('S-Wallet to SWallet',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {

                        },
                      ),
                    ],
                  ),
                ],
                onExpansionChanged: (bool expanded) {},
              ),
              ExpansionTile(
                leading: const Icon(Icons.wallet_membership),
                title: const Text('Member Support'),
                trailing: const Icon(Icons.arrow_forward_ios),
                children: <Widget>[
                  ExpansionTile(
                    leading: const Icon(Icons.request_page_sharp),
                    title: const Text('Ticket Support',
                        style: TextStyle(fontSize: 14)),
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.airplane_ticket_rounded),
                        title: const Text('Generate Ticket',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {

                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.list_alt_sharp),
                        title: const Text('List Tickets',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
                onExpansionChanged: (bool expanded) {},
              ),
              ExpansionTile(
                leading: const Icon(Icons.wallet_giftcard),
                title: const Text('Recharge'),
                trailing: const Icon(Icons.arrow_forward_ios),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('Recharge History Latest',
                        style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Handle tap on "Add Bank Account"
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.offline_bolt),
                    title: const Text('Recharge History Old',
                        style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {},
                  ),
                ],
              ),
              ExpansionTile(
                leading: const Icon(Icons.verified),
                title: const Text('Vendor'),
                trailing: const Icon(Icons.arrow_forward_ios),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.view_array_sharp),
                    title:
                    const Text('My Visit', style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Myiquiryreport()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.energy_savings_leaf),
                    title: const Text('My Enquiry',
                        style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {
                      // Handle tap on "View Bank Accounts"
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.reviews),
                    title:
                    const Text('My Review', style: TextStyle(fontSize: 14)),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50.0),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log out'),
                onTap: () {
                  Navigator.pop(context);
                  showLogoutConfirmationDialog(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(color: Colors.black),
              SizedBox(height: screenSize.height * 0.02),
              Center(
                child: Container(
                  height: 50,width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_rounded, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _currentCity,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for a stuff you like ',
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.blue),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isLandscape =
                        MediaQuery.of(context).orientation == Orientation.landscape;
                    final screenSize = MediaQuery.of(context).size;
                    double containerHeight = isLandscape
                        ? screenSize.height * 1.1
                        : screenSize.height * 0.27;


                    double adContainerSize = screenSize.width < screenSize.height
                        ? screenSize.width * 0.8
                        : screenSize.height * 0.8;

                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              // Carousel Slider Section
                              Container(
                                margin: const EdgeInsets.all(16.0),
                                padding: const EdgeInsets.all(0.0),
                                width: screenSize.width * 0.9,
                                height: containerHeight,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.9),
                                      spreadRadius: 9,
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    CarouselSlider(
                                      items: imageList.map(
                                            (item) => Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: containerHeight,
                                          child: Image.asset(
                                            item['image_path']!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ).toList(),
                                      carouselController: carouselController,
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        viewportFraction: 1.0,
                                        enlargeCenterPage: false,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            currentIndex = index; // Update currentIndex on page change
                                          });
                                        },
                                      ),
                                    ),
                                    // Dots Indicator
                                    Positioned(
                                      bottom: 3,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: imageList.asMap().entries.map((entry) {
                                          return GestureDetector(
                                            onTap: () {
                                              carouselController.animateToPage(entry.key);
                                              setState(() {
                                                currentIndex = entry.key; // Update currentIndex
                                              });
                                            },
                                            child: Container(
                                              width: 10.0,
                                              height: 10.0,
                                              margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: currentIndex == entry.key
                                                    ? Colors.orange
                                                    : Colors.grey.withOpacity(0.5),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),

// Carousel Slider Secti
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),

                              // Categories Section
                              Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black, width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Categories",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: screenSize.height * 0.02),
                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: isLandscape ? 6 : 4,
                                        mainAxisSpacing: isLandscape ? 20 : 15,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: isLandscape
                                            ? (screenSize.width / 6) /
                                            (screenSize.width / 6 * 1.5)
                                            : (screenSize.width / 4) /
                                            (screenSize.width / 4 * 1.5),
                                      ),
                                      itemCount: categoryIcons.length,
                                      itemBuilder: (context, index) {
                                        return CategoryIcon(
                                          icon: categoryIcons[index].icon,
                                          label: categoryIcons[index].label,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),

                              // Spacer for extra space after categories
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),

                        if (showAdContainer)
                          Positioned(
                            top: screenSize.height * 0.01,
                            left: screenSize.width * 0.07,
                            right: screenSize.width * 0.05,
                            child: Container(
                              width: screenSize.width * 0.9,
                              height: screenSize.height * 0.7,
                              margin: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.07,
                                vertical: screenSize.height * 0.02,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/26.png',  // Your ad image
                                      width: screenSize.width * 0.9,
                                      height: screenSize.height * 0.7,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  // Close Button
                                  Positioned(
                                    top: screenSize.height * 0.01,
                                    right: screenSize.width * 0.02,
                                    child: IconButton(
                                      icon: Icon(Icons.close, color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          showAdContainer = false;  // Hides the ad container
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
              Row(
                children: const [
                  SizedBox(width: 20),
                  Text(
                    "Top Categories",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    topCategoriesImages.length,
                        (index) {
                      final isLandscape = MediaQuery.of(context).orientation ==
                          Orientation.landscape;
                      final screenSize = MediaQuery.of(context).size;

                      double containerWidth = isLandscape
                          ? screenSize.width * 0.3
                          : screenSize.width * 0.4;

                      double containerHeight = isLandscape
                          ? screenSize.height * 0.3
                          : screenSize.height * 0.2;

                      // List of category names corresponding to the images
                      List<String> topCategoriesText = [
                        'Hotel',
                        'Fast Food',
                        'Mens Wear',
                        'Ice Cream',
                        'Bakery',
                        'Restaurants'
                      ];

                      return GestureDetector(
                        onTap: () {
                          if (topCategoriesText[index] == 'Hotel') {
                            // Navigate to HotelPage
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => Hotels()),
                            // );
                          }
                          // You can add navigation for other categories similarly here
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              width: containerWidth,
                              height: containerHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border:
                                Border.all(color: Colors.grey, width: 2),
                                image: DecorationImage(
                                  image: AssetImage(topCategoriesImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.01),
                            Text(
                              topCategoriesText[index],
                              style: TextStyle(
                                fontSize: isLandscape ? 14 : 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  SizedBox(width: 20),
                  Text(
                    "Special offers",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    topCategoriesImages.length,
                        (index) {
                      final isLandscape = MediaQuery.of(context).orientation ==
                          Orientation.landscape;
                      final screenSize = MediaQuery.of(context).size;

                      double containerWidth = isLandscape
                          ? screenSize.width * 0.3
                          : screenSize.width * 0.7;

                      double containerHeight = isLandscape
                          ? screenSize.height * 0.4
                          : screenSize.height * 0.2;

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: containerWidth,
                        height: containerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 2),
                          image: DecorationImage(
                            image: AssetImage(specialoffrecesImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryIcon({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: screenSize.width * 0.1,
            color: Colors.blue,
          ),
          const SizedBox(height: 8.0),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 7.0, // Adjust font size if needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<CategoryIconModel> categoryIcons = [
  CategoryIconModel(Icons.hotel, 'Hotels'),
  CategoryIconModel(Icons.restaurant, 'Restaurants'),
  CategoryIconModel(Icons.spa, 'Beauty Parlour & Spa'),
  CategoryIconModel(Icons.sports_gymnastics, 'GYM'),
  CategoryIconModel(Icons.square_foot_rounded, 'Footwear'),
  CategoryIconModel(Icons.electric_bolt, 'Electronics'),
  CategoryIconModel(Icons.book, 'Book Gas Cylinder'),
  CategoryIconModel(Icons.view_list_rounded, 'View More'),
];

class CategoryIconModel {
  final IconData icon;
  final String label;

  CategoryIconModel(this.icon, this.label);
}

List<String> topCategoriesImages = [
  'assets/images/o.png',
  'assets/images/p.png',
  'assets/images/c.png',
  'assets/images/m.png',
  'assets/images/b.png',
  'assets/images/r.png',
];

List<String> specialoffrecesImages = [
  'assets/images/np.png',
  'assets/images/twitter.png',
  'assets/images/check.png',
  'assets/images/Entry.png',
  'assets/images/check.png',
  'assets/images/c.png',
];