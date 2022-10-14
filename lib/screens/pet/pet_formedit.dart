import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petapp/constants.dart';
import 'package:petapp/widgets/custom_button.dart';
import 'package:petapp/widgets/custom_textfield.dart';
import 'package:signature/signature.dart';
import '../../services/addpet.dart';
import '../../widgets/custom_date.dart';
import '../../widgets/custom_time.dart';

class PetEditForm extends StatefulWidget {
  String userid;
  String petid;
  PetEditForm({required this.userid, required this.petid});

  @override
  State<PetEditForm> createState() => _PetEditFormState();
}

class _PetEditFormState extends State<PetEditForm> {
  var formKey = GlobalKey<FormState>();
  //section 1
  var petname = TextEditingController();
  var breed = TextEditingController();
  var color = TextEditingController();
  var weight = TextEditingController();
  var lastheat = TextEditingController();
  var nextheat = TextEditingController();
  var petdob = TextEditingController();
  String? gender;
  String? spayedNeutered;
  //section 2
  var vetName = TextEditingController();
  var vetContact = TextEditingController();
//sec 3

  String? isMedicationC = 'No';
  var medication1 = TextEditingController();
  var dosage1 = TextEditingController();
  var prescribe1 = TextEditingController();
  var medication2 = TextEditingController();
  var dosage2 = TextEditingController();
  var prescribe2 = TextEditingController();
  var medication3 = TextEditingController();
  var dosage3 = TextEditingController();
  var prescribe3 = TextEditingController();
  // sec 4

  String? isVaccinationC = 'No';
  var rabieslast = TextEditingController();
  var rabiesnext = TextEditingController();
  var sevenlast = TextEditingController();
  var sevennext = TextEditingController();
  var bordetalast = TextEditingController();
  var bordetanext = TextEditingController();
  var deworlast = TextEditingController();
  var dewornext = TextEditingController();
  var deticklast = TextEditingController();
  var deticknext = TextEditingController();
  var anyotherlast = TextEditingController();
  var anyothernext = TextEditingController();

  //section 5
  var proneToList = [
    'Eye Infection',
    'Eye Drainage',
    'Sensitive Pad',
    'Skin Allergies',
    'Stress Diarrhea',
    'Not Applicable'
  ];
  String? proneTo = 'Not Applicable';

  //section 6
  var petTendList = [
    'Food',
    'Treats',
    'Toys',
    'Bed',
    'Not Applicable',
  ];
  String? petTend = 'Not Applicable';
  //section 7
  var parkDaycareList = [
    'Every Day',
    'Every Week',
    ' Every Month',
    'Not Applicable'
  ];
  String? parkDaycare = 'Not Applicable';
  //section 8
  var petAroundList = [
    'Every Day',
    'Every Week',
    'Every Month',
    'Not Applicable'
  ];
  String? petAround;

  //section 9
  String? petDescribe = 'Not Applicable';
  var petDescribeList = [
    'Sometime Play With Other Dogs',
    'Usually Ignores Other Dogs',
    'Can Be Aggressive At times',
    'Never Been Around With Other Dogs',
    'Love To Play With Other Dogs',
    'Not Applicable'
  ];
//section 11

  //var choose = Choose.No;
  var allergicMedicine = TextEditingController();
  var allergicFood = TextEditingController();
  var allergicgrass = TextEditingController();
  var medicationlast6 = TextEditingController();
  var majorillness = TextEditingController();
  var fearOfThunder = TextEditingController();
  var fearDislike = TextEditingController();
  var bittenDog = TextEditingController();
  var bittenHuman = TextEditingController();

  String? allergicMedicineC = 'No';
  String? allergicFoodC = 'No';
  String? allergicgrassC = 'No';
  String? medicationlast6C = 'No';
  String? majorillnessC = 'No';
  String? fearOfThunderC = 'No';
  String? fearDislikeC = 'No';
  String? bittenDogC = 'No';
  String? bittenHumanC = 'No';

  //section 10

  var petExercise = TextEditingController();
  //12 section
  var mrngTime = TextEditingController();
  var afrnTime = TextEditingController();
  var eveTime = TextEditingController();
  var nytTime = TextEditingController();
  var mrngDiet = TextEditingController();
  var afrnDiet = TextEditingController();
  var eveDiet = TextEditingController();
  var nytDiet = TextEditingController();
  var mrngQyt = TextEditingController();
  var afrnQyt = TextEditingController();
  var eveQyt = TextEditingController();
  var nytQyt = TextEditingController();

  //last

  var place = TextEditingController();
  var date = TextEditingController();

  bool isLoading = false; //edit

  getPetDetails() async {
    FirebaseFirestore.instance
        .collection('pet details')
        .doc(widget.userid)
        .collection('pet')
        .doc(widget.petid)
        .get()
        .then((value) {
      setState(() {
        petname.text = value['petname'];
        breed.text = value['breed'];
        color.text = value['color'];
        petdob.text = value['dob'];
        weight.text = value['weight'];
        lastheat.text = value['lastheat'];
        nextheat.text = value['nextheat'];
        gender = value['gender'];
        spayedNeutered = value['spayedNeutered'];
        vetName.text = value['vetName'];
        vetContact.text = value['mobile'];
        isMedicationC = value['isMedicaion'];
        medication1.text = value['medication1'];
        dosage1.text = value['dosage1'];
        prescribe1.text = value['prescribe1'];
        medication2.text = value['medication2'];
        dosage2.text = value['dosage2'];
        prescribe2.text = value['prescribe2'];
        medication3.text = value['medication3'];
        dosage3.text = value['dosage3'];
        prescribe3.text = value['prescribe3'];
        isVaccinationC = value['isVaccinationC'];
        rabieslast.text = value['rabieslast'];
        rabiesnext.text = value['rabiesnext'];
        sevenlast.text = value['sevenlast'];
        sevennext.text = value['sevennext'];
        bordetalast.text = value['bordetalast'];
        bordetanext.text = value['bordetanext'];
        deworlast.text = value['deworlast'];
        dewornext.text = value['dewornext'];
        deticklast.text = value['deticklast'];
        deticknext.text = value['deticknext'];
        anyotherlast.text = value['anyotherlast'];
        anyothernext.text = value['anyothernext'];
        proneTo = value['petProneTo'];

        petTend = value['petPossessive'];
        parkDaycare = value['parkDaycare'];
        petAround = value['petAround'];
        petDescribe = value['petDescribe'];
        petExercise.text = value['petExercise'];

        allergicMedicine.text = value['allergicMedicine'];
        allergicFood.text = value['allergicFood'];
        allergicgrass.text = value['allergicgrass'];
        medicationlast6.text = value['medicationlast6'];
        majorillness.text = value['majorillness'];
        fearOfThunder.text = value['fearOfThunder'];
        fearDislike.text = value['fearDislike'];
        bittenDog.text = value['bittenDog'];
        bittenHuman.text = value['bittenHuman'];
        allergicMedicineC = value['allergicMedicineC'];
        allergicFoodC = value['allergicFoodC'];
        allergicgrassC = value['allergicgrassC'];
        medicationlast6C = value['medicationlast6C'];
        majorillnessC = value['majorillnessC'];
        fearOfThunderC = value['fearOfThunderC'];
        fearDislikeC = value['fearDislikeC'];
        bittenDogC = value['bittenDogC'];
        bittenHumanC = value['bittenHumanC'];
        //
        mrngTime.text = value['mrngTime'];
        eveTime.text = value['eveTime'];
        afrnTime.text = value['afrnTime'];
        nytTime.text = value['nytTime'];
        mrngDiet.text = value['mrngDiet'];
        eveDiet.text = value['eveDiet'];
        afrnDiet.text = value['afrnDiet'];
        nytDiet.text = value['nytDiet'];
        mrngQyt.text = value['mrngqyt'];
        eveQyt.text = value['eveqyt'];
        afrnQyt.text = value['afrnqyt'];
        nytQyt.text = value['nytqyt'];
        date.text = value['date'];
        place.text = value['place'];
        var imageSav = value['sign'];
        List<int> intList =
            imageSav!.cast<int>().toList(); //This is the magical line.
        exportedImage = Uint8List.fromList(intList);
      });
    });
  }

  @override
  void initState() {
    getPetDetails();
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Pet Boarding Form'),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(25),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. Pet Information',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        CustomTextField(
                          value: petname,
                          text: 'Pet Name',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                        heightSpace,
                        CustomTextField(
                          value: breed,
                          text: 'Breed',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                        heightSpace,
                        CustomTextField(
                          value: color,
                          text: 'Color',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                        heightSpace,
                        CustomDate(
                          validate: (value) {},
                          controller: petdob,
                          hint: 'DOB',
                        ),
                        heightSpace,
                        Row(
                          children: [
                            Expanded(
                              child: CustomDate(
                                validate: (value) {},
                                controller: lastheat,
                                hint: 'Last Heat',
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: CustomDate(
                                validate: (value) {},
                                controller: nextheat,
                                hint: 'Next Heat',
                              ),
                            ),
                          ],
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Male',
                                groupValue: gender,
                                onChanged: (String? value) {
                                  setState(() {
                                    gender = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'Female',
                              groupValue: gender,
                              onChanged: (String? value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 'Spayed',
                              groupValue: spayedNeutered,
                              onChanged: (String? value) {
                                setState(() {
                                  spayedNeutered = value;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Spayed',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'Neutered',
                              groupValue: spayedNeutered,
                              onChanged: (String? value) {
                                setState(() {
                                  spayedNeutered = value;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Neutered',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        heightSpace,
                        CustomTextField(
                          textInputType: TextInputType.number,
                          value: weight,
                          text: 'Weight',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '2. Veterinary Details',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        CustomTextField(
                          value: vetName,
                          text: 'Name',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                        heightSpace,
                        CustomTextField(
                          textInputType: TextInputType.number,
                          value: vetContact,
                          text: 'Mobile',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '3. Medications on A Regular Basis',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: isMedicationC,
                                onChanged: (String? value) {
                                  setState(() {
                                    isMedicationC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: isMedicationC,
                              onChanged: (String? value) {
                                setState(() {
                                  isMedicationC = value;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (isMedicationC == 'Yes')
                          Table(
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CustomTextField(
                                    value: medication1,
                                    text: 'Medication 1',
                                    validate: (value) {},
                                  ),
                                ),
                                CustomTextField(
                                  value: dosage1,
                                  text: 'Dosage 1',
                                  validate: (value) {},
                                ),
                                CustomTextField(
                                  value: prescribe1,
                                  text: 'Prescribe 1',
                                  validate: (value) {},
                                )
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CustomTextField(
                                    value: medication2,
                                    text: 'Medication 2',
                                    validate: (value) {},
                                  ),
                                ),
                                CustomTextField(
                                  value: dosage2,
                                  text: 'Dosage 2',
                                  validate: (value) {},
                                ),
                                CustomTextField(
                                  value: prescribe2,
                                  text: 'Prescribe 2',
                                  validate: (value) {},
                                )
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CustomTextField(
                                    value: medication3,
                                    text: 'Medication 3',
                                    validate: (value) {},
                                  ),
                                ),
                                CustomTextField(
                                  value: dosage3,
                                  text: 'Dosage 3',
                                  validate: (value) {},
                                ),
                                CustomTextField(
                                  value: prescribe3,
                                  text: 'Prescribe 3',
                                  validate: (value) {},
                                )
                              ]),
                            ],
                          ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '4. Vaccination Details',
                          style: headingMiddle,
                        ),
                        heightSpace,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: isVaccinationC,
                                onChanged: (String? value) {
                                  setState(() {
                                    isVaccinationC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: isVaccinationC,
                              onChanged: (String? value) {
                                setState(() {
                                  isVaccinationC = value;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (isVaccinationC == 'Yes')
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Last Due',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Next Due',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              heightSpace,
                              Table(
                                children: [
                                  TableRow(children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: CustomDate(
                                        validate: (value) {},
                                        controller: rabieslast,
                                        hint: 'Rabies ',
                                      ),
                                    ),
                                    CustomDate(
                                      validate: (value) {},
                                      controller: rabiesnext,
                                      hint: 'Rabies ',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: CustomDate(
                                        validate: (value) {},
                                        controller: sevenlast,
                                        hint: '7 in 1 ',
                                      ),
                                    ),
                                    CustomDate(
                                      validate: (value) {},
                                      controller: sevennext,
                                      hint: '7 in 1  ',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: CustomDate(
                                        validate: (value) {},
                                        controller: bordetalast,
                                        hint: 'Bordetella ',
                                      ),
                                    ),
                                    CustomDate(
                                      validate: (value) {},
                                      controller: bordetanext,
                                      hint: 'Bordetella ',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: CustomDate(
                                        validate: (value) {},
                                        controller: deworlast,
                                        hint: 'Deworming ',
                                      ),
                                    ),
                                    CustomDate(
                                      validate: (value) {},
                                      controller: dewornext,
                                      hint: 'Deworming ',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: CustomDate(
                                        validate: (value) {},
                                        controller: deticklast,
                                        hint: 'De-Tick ',
                                      ),
                                    ),
                                    CustomDate(
                                      validate: (value) {},
                                      controller: deticknext,
                                      hint: 'De-Tick ',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    CustomDate(
                                      validate: (value) {},
                                      controller: anyotherlast,
                                      hint: 'Any Other',
                                    ),
                                    CustomDate(
                                      validate: (value) {},
                                      controller: anyothernext,
                                      hint: 'Any Other',
                                    ),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        heightSpace,

                        Text(
                          '5. Is Your Pet Prone To',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        DropdownButtonFormField(
                          validator: (value) =>
                              value == null ? 'This field required' : null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pet Prone To',
                          ),
                          value: proneTo,
                          items: proneToList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              proneTo = newValue!;
                              print(proneTo);
                            });
                          },
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '6. Does Your Pet Tend To Be Possessive Of',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        DropdownButtonFormField(
                          validator: (value) =>
                              value == null ? 'This field required' : null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pet Possessive Of',
                          ),
                          value: petTend,
                          items: petTendList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              petTend = newValue!;
                              print(petTend);
                            });
                          },
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '7. How Often Your Pet Goes To The Dog Park Or DayCare',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        DropdownButtonFormField(
                          validator: (value) =>
                              value == null ? 'This field required' : null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Park or Daycare',
                          ),
                          value: parkDaycare,
                          items: parkDaycareList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              parkDaycare = newValue!;
                              print(parkDaycare);
                            });
                          },
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '8. How Often Your Pet Around Other Dogs',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        DropdownButtonFormField(
                          validator: (value) =>
                              value == null ? 'This field required' : null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pet Around',
                          ),
                          value: petAround,
                          items: petAroundList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              petAround = newValue!;
                              print(petAround);
                            });
                          },
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '9. Which Option Below Describes Your Pet',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        DropdownButtonFormField(
                          validator: (value) =>
                              value == null ? 'This field required' : null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Pet Describe',
                          ),
                          value: petDescribe,
                          items: petDescribeList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              petDescribe = newValue!;
                              print(petDescribe);
                            });
                          },
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '10. How Many Hours Your Pet Gets Excercise In A Day',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        CustomTextField(
                          textInputType: TextInputType.number,
                          value: petExercise,
                          text: 'Pet Exercise Hours',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '11. Is Your Pet',
                          style: headingMiddle,
                        ),
                        //1
                        heightSpace,
                        Text(
                          '* Allergic to any medicines?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: allergicMedicineC,
                                onChanged: (String? value) {
                                  setState(() {
                                    allergicMedicineC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: allergicMedicineC,
                              onChanged: (String? value) {
                                setState(() {
                                  allergicMedicineC = value;
                                  allergicMedicine.text = '';
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (allergicMedicineC == 'Yes')
                          CustomTextField(
                            value: allergicMedicine,
                            text: 'Specify the details',
                            validate: (value) {},
                          ),
                        //2
                        heightSpace,
                        Text(
                          '* Allergic to foods?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: allergicFoodC,
                                onChanged: (String? value) {
                                  setState(() {
                                    allergicFoodC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: allergicFoodC,
                              onChanged: (String? value) {
                                setState(() {
                                  allergicFoodC = value;
                                  allergicFood.text = '';
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (allergicFoodC == 'Yes')
                          CustomTextField(
                            value: allergicFood,
                            text: 'Specify the details',
                            validate: (value) {},
                          ),
                        //3
                        heightSpace,
                        Text(
                          '* Allergic to Any Grass/ Mud etc?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: allergicgrassC,
                                onChanged: (String? value) {
                                  setState(() {
                                    allergicgrassC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: allergicgrassC,
                              onChanged: (String? value) {
                                setState(() {
                                  allergicgrassC = value;
                                  allergicgrass.text = '';
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (allergicgrassC == 'Yes')
                          CustomTextField(
                            value: allergicgrass,
                            text: 'Specify the details',
                            validate: (value) {},
                          ),
                        //4
                        heightSpace,
                        Text(
                          '* On any Medication within Last 6month?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: medicationlast6C,
                                onChanged: (String? value) {
                                  setState(() {
                                    medicationlast6C = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: medicationlast6C,
                              onChanged: (String? value) {
                                setState(() {
                                  medicationlast6C = value;
                                  medicationlast6.text = '';
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (medicationlast6C == 'Yes')
                          CustomTextField(
                            value: medicationlast6,
                            text: 'Specify the details',
                            validate: (value) {},
                          ),
                        //5
                        heightSpace,
                        Text(
                          '* Any Major Illness History?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: majorillnessC,
                                onChanged: (String? value) {
                                  setState(() {
                                    majorillnessC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: majorillnessC,
                              onChanged: (String? value) {
                                setState(() {
                                  majorillnessC = value;
                                  majorillness.text = '';
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (majorillnessC == 'Yes')
                          CustomTextField(
                            value: majorillness,
                            text: 'Specify the details',
                            validate: (value) {},
                          ),
                        //6
                        heightSpace,
                        Text(
                          '* Excessively Fearful of Thunderstorms?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: fearOfThunderC,
                                onChanged: (String? value) {
                                  setState(() {
                                    fearOfThunderC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: fearOfThunderC,
                              onChanged: (String? value) {
                                setState(() {
                                  fearOfThunderC = value;
                                  fearOfThunder.text = '';
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (fearOfThunderC == 'Yes')
                          CustomTextField(
                            value: fearOfThunder,
                            text: 'Specify the details',
                            validate: (value) {},
                          ),
                        //7
                        heightSpace,
                        Text(
                          '* Have any Specific Fear of Dislike?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: fearDislikeC,
                                onChanged: (String? value) {
                                  setState(() {
                                    fearDislikeC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: fearDislikeC,
                              onChanged: (String? value) {
                                setState(() {
                                  fearDislikeC = value;
                                  fearDislike.text = '';
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (fearDislikeC == 'Yes')
                          CustomTextField(
                            value: fearDislike,
                            text: 'Specify the details',
                            validate: (value) {},
                          ),
                        //8
                        heightSpace,
                        Text(
                          '* Bitten Any Other Dog?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: bittenDogC,
                                onChanged: (String? value) {
                                  setState(() {
                                    bittenDogC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: bittenDogC,
                              onChanged: (String? value) {
                                setState(() {
                                  bittenDogC = value;
                                  bittenDog.text = '';
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (bittenDogC == 'Yes')
                          CustomTextField(
                            value: bittenDog,
                            text: 'Specify the details',
                            validate: (value) {},
                          ),
                        //9
                        heightSpace,
                        Text(
                          '* Bitten Any Human Being?',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                                value: 'Yes',
                                groupValue: bittenHumanC,
                                onChanged: (String? value) {
                                  setState(() {
                                    bittenHumanC = value;
                                  });
                                }),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                              value: 'No',
                              groupValue: bittenHumanC,
                              onChanged: (String? value) {
                                setState(() {
                                  bittenHumanC = value;
                                  bittenHuman.text = '';
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        if (bittenHumanC == 'Yes')
                          CustomTextField(
                            value: bittenHuman,
                            text: 'Specify the details',
                            validate: (value) {},
                          ),
                        heightSpace,
                        heightSpace,
                        Text(
                          '12. Meal Schedule',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        Table(
                          children: [
                            const TableRow(children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Time',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Diet',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Quantity',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTime(
                                  hintText: 'Morning',
                                  selectedTime: mrngTime,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTextField(
                                  value: mrngDiet,
                                  text: 'Diet',
                                  validate: (String) {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTextField(
                                  value: mrngQyt,
                                  text: 'Qty',
                                  validate: (String) {},
                                ),
                              ),
                            ]), //done mrng
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTime(
                                  hintText: 'Afternoon',
                                  selectedTime: afrnTime,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTextField(
                                  value: afrnDiet,
                                  text: 'Diet',
                                  validate: (String) {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTextField(
                                  value: afrnQyt,
                                  text: 'Qty',
                                  validate: (String) {},
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTime(
                                  hintText: 'Evening',
                                  selectedTime: eveTime,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTextField(
                                  value: eveDiet,
                                  text: 'Diet',
                                  validate: (String) {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTextField(
                                  value: eveQyt,
                                  text: 'Qty',
                                  validate: (String) {},
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTime(
                                  hintText: 'Night',
                                  selectedTime: nytTime,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTextField(
                                  value: nytDiet,
                                  text: 'Diet',
                                  validate: (String) {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: CustomTextField(
                                  value: nytQyt,
                                  text: 'Qty',
                                  validate: (String) {},
                                ),
                              ),
                            ]),
                          ],
                        ),
                        heightSpace,
                        heightSpace,
                        const Text(
                          '* I Have Filled in All the Details to My Best Knowledge',
                          style: headingMiddle,
                        ),
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Signature',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        if (exportedImage != null)
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            //  margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Image.memory(exportedImage!),
                          ),
                        heightSpace,
                        CustomTextField(
                          value: place,
                          text: 'Place',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field is required';
                            }
                          },
                        ),
                        heightSpace,
                        CustomDate(
                          validate: (value) {},
                          controller: date,
                          hint: 'Date',
                        ),
                        heightSpace,
                        heightSpace,
                        CustomButton(
                            name: 'Update',
                            onSubmit: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                UpdatePet.UpdatePetDetails(
                                  userid: widget.userid,
                                  petid: widget.petid,
                                  petname: petname.text,
                                  breed: breed.text,
                                  color: color.text,
                                  dob: petdob.text,
                                  weight: weight.text,
                                  lastHeat: lastheat.text,
                                  nextHeat: nextheat.text,
                                  gender: gender.toString(),
                                  spayedNeutered: spayedNeutered.toString(),
                                  vetName: vetName.text,
                                  mobile: vetContact.text,
                                  petProneTo: proneTo.toString(),
                                  petPossessive: petTend.toString(),
                                  parkDaycare: parkDaycare.toString(),
                                  petAround: petAround.toString(),
                                  petDescribe: petDescribe.toString(),
                                  petExercise: petExercise.text,
                                  isMedicaion: isMedicationC.toString(),
                                  medication1: medication1.text,
                                  dosage1: dosage1.text,
                                  prescribe1: prescribe1.text,
                                  medication2: medication2.text,
                                  dosage2: dosage2.text,
                                  prescribe2: prescribe2.text,
                                  medication3: medication3.text,
                                  dosage3: dosage3.text,
                                  prescribe3: prescribe3.text,
                                  isVaccinationC: isVaccinationC.toString(),
                                  rabieslast: rabieslast.text,
                                  rabiesnext: rabiesnext.text,
                                  sevenlast: sevenlast.text,
                                  sevennext: sevennext.text,
                                  bordetalast: bordetalast.text,
                                  bordetanext: bordetanext.text,
                                  deworlast: deworlast.text,
                                  dewornext: dewornext.text,
                                  deticklast: deticklast.text,
                                  deticknext: deticknext.text,
                                  anyotherlast: anyotherlast.text,
                                  anyothernext: anyothernext.text,
                                  allergicMedicine: allergicMedicine.text,
                                  allergicFood: allergicFood.text,
                                  allergicgrass: allergicgrass.text,
                                  medicationlast6: medicationlast6.text,
                                  majorillness: majorillness.text,
                                  fearOfThunder: fearOfThunder.text,
                                  fearDislike: fearDislike.text,
                                  bittenDog: bittenDog.text,
                                  bittenHuman: bittenHuman.text,
                                  allergicMedicineC:
                                      allergicMedicineC.toString(),
                                  allergicFoodC: allergicFoodC.toString(),
                                  allergicgrassC: allergicgrassC.toString(),
                                  medicationlast6C: medicationlast6C.toString(),
                                  majorillnessC: majorillnessC.toString(),
                                  fearOfThunderC: fearOfThunderC.toString(),
                                  fearDislikeC: fearDislikeC.toString(),
                                  bittenDogC: bittenDogC.toString(),
                                  bittenHumanC: bittenHumanC.toString(),
                                  mrngtime: mrngTime.text,
                                  evetime: eveTime.text,
                                  afrntime: afrnTime.text,
                                  nyttime: nytTime.text,
                                  mrngdiet: mrngDiet.text,
                                  evediet: eveDiet.text,
                                  afrndiet: afrnDiet.text,
                                  nytdiet: nytDiet.text,
                                  mrngqyt: mrngQyt.text,
                                  eveqyt: eveQyt.text,
                                  afrnqyt: afrnQyt.text,
                                  nytqyt: nytQyt.text,
                                  place: place.text,
                                  date: date.text,
                                  context: context,
                                ).then((value) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.of(context).pop();
                                });

                                print('done');
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ));
  }

  Uint8List? exportedImage;
}
