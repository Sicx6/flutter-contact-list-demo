import 'package:flutter/material.dart';
import 'package:flutter_interview_demo/const/global_var.dart';
import 'package:flutter_interview_demo/provider/contact_provider.dart';
import 'package:get/get.dart';

class ContactScreen extends StatelessWidget {
  final ContactProvider _contactProvider = Get.find();

  ContactScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          flexibleSpace: Container(
            color: Colors.white,
          ),
          title: Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            height: 40,
            child: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.grey),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _contactProvider.clearSearch(searchController);
                  },
                  child: FractionallySizedBox(
                    heightFactor: 0.5, // Adjust the height factor as desired
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.clear,
                          size: 12, color: Colors.black87),
                    ),
                  ),
                ),
                filled: true,
                fillColor: lightBlue,
                hintText: 'Search...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
              ),
              onChanged: (value) => _contactProvider.filterContacts(value),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Text(
                  'Contacts',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () {
                final searchList = _contactProvider.searchList;

                return ListView.builder(
                  itemCount: searchList.length,
                  itemBuilder: (context, index) {
                    final items = searchList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFB9B8B8),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFA8AC),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFB9B8B8),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0, -2),
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _contactProvider
                                        .getFirstInitialsName(items),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    _contactProvider.getLastInitialsName(items),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 25),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    children: _contactProvider
                                        .getHighlightedNameSpans(
                                      items.name,
                                      searchController.text,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(items.email),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
