import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/filter_button.dart';
import 'package:sarnfan/widgets/post_card.dart';
import 'package:sarnfan/widgets/search_bar.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var activityValue = 'All';
  var activities = ['All', 'Volunteer', 'Donation', 'Workshop', 'Other'];
  var regionValue = 'All';
  var regions = [
    'All',
    'Central',
    'Nortern',
    'Northerneast',
    'Eastern',
    'Western',
    'Southern'
  ];
  var typeValue = 'All';
  var types = ['All', 'School', 'Campaign', 'Individual'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pri500,
        appBar: AppBar(
          leadingWidth: 30,
          backgroundColor: AppColors.pri500,
          foregroundColor: AppColors.neu50,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Search',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.neu50)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: SearchField(),
              ),
              SizedBox(
                height: 20,
              ),
              WhiteSurface(
                  minHeight: MediaQuery.of(context).size.height - 164,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: types.map((type) {
                            return Expanded(
                              flex: 1,
                              child: FilterButton(
                                text: type,
                                isSelected: type == typeValue,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: 20, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Activity",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    DropdownMenu(
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      onSelected: (activity) => {
                                        if (activity != null)
                                          {
                                            setState(() {
                                              activityValue = activity;
                                            }),
                                            print("activity :" + activity)
                                          }
                                      },
                                      initialSelection: "All",
                                      dropdownMenuEntries:
                                          activities.map((option) {
                                        return DropdownMenuEntry(
                                            value: option, label: option);
                                      }).toList(),
                                    ),
                                  ]),
                              // SizedBox(width: 20),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Region",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    DropdownMenu(
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      onSelected: (region) => {
                                        if (region != null)
                                          {
                                            setState(() {
                                              regionValue = region;
                                            }),
                                            print("region :" + region)
                                          }
                                      },
                                      initialSelection: "All",
                                      dropdownMenuEntries:
                                          regions.map((option) {
                                        return DropdownMenuEntry(
                                            value: option, label: option);
                                      }).toList(),
                                    ),
                                  ])
                            ],
                          )),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        child: Text(
                          "Search Results",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20),
                            child: PostCard(
                                title:
                                    "Need improvement for playground (painting)",
                                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                                date: "07:00 PM 24 Jab 2024",
                                tags: ["school", "volunteer"]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20),
                            child: PostCard(
                                title:
                                    "Need improvement for playground (painting)",
                                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                                date: "07:00 PM 24 Jab 2024",
                                tags: ["school", "volunteer"]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20),
                            child: PostCard(
                                title:
                                    "Need improvement for playground (painting)",
                                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                                date: "07:00 PM 24 Jab 2024",
                                tags: ["school", "volunteer"]),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
