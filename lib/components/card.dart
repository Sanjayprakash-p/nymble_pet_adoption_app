import 'package:flutter/material.dart';
import 'package:nymble_pet_adoption/components/data.dart';

class Homecard extends StatefulWidget {
  final Pet pet;
  final int index;
  const Homecard({super.key, required this.pet, required this.index});

  @override
  State<Homecard> createState() => _HomecardState();
}

class _HomecardState extends State<Homecard> {
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: widget.pet.isAdopted ? Colors.grey : Colors.white,
      surfaceTintColor: Colors.white,
      child: SizedBox(
        width: double.infinity, // Set the card width to match the parent width
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: widget.pet.isAdopted ? 0.2 : 1,
                        fit: BoxFit.cover,
                        image:
                            AssetImage('assets/images/${widget.pet.picture}'),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.pet.like = !widget.pet.like;
                      });
                    },
                    icon: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: Icon(
                        widget.pet.like ? Icons.star : Icons.star_border,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.pet.name.split(" ")[0],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              CircleAvatar(
                                radius: 13,
                                backgroundColor: widget.pet.gender == "female"
                                    ? Colors.pink.shade100
                                    : Colors.blue.shade100,
                                child: Icon(
                                  widget.pet.gender == "female"
                                      ? Icons.female
                                      : Icons.male,
                                  color: widget.pet.gender == "female"
                                      ? Colors.pink
                                      : Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Flexible(
                              child: Text(
                                widget.pet.address.split(",")[2],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  widget.pet.isAdopted
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          child: Transform(
                            // alignment: Alignment.center,
                            transform: Matrix4.rotationZ(-0.75),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              color: Colors.red,
                              child: Text(
                                "Already Adopted",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ))
                      : Text("")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
