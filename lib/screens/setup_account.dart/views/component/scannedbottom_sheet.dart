import 'package:flutter/material.dart';
import 'package:nextdoorgym/screens/setup_account.dart/controller/setup_account_provider.dart';
import 'package:nextdoorgym/services/local_storage_service.dart';
import 'package:provider/provider.dart';

class ScannedBottomSheet extends StatefulWidget {
  final String id;

  const ScannedBottomSheet({
    super.key,
    required this.id,
  });

  @override
  State<ScannedBottomSheet> createState() => _ScannedBottomSheetState();
}

class _ScannedBottomSheetState extends State<ScannedBottomSheet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SetupAccountProvider>().getAmenityForUser(
          id: widget.id,
          buildingId: LocalStoragaeService.getUserValue(
            UserField.buildingInternalId,
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30,
          ),
          topRight: Radius.circular(
            30,
          ),
        ),
      ),
      child: Center(
        child: Consumer<SetupAccountProvider>(builder: (context, provider, _) {
          return provider.isBottomSheetLoading
              ? const CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    const Text(
                      "Amenity",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Amenity: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            provider.amenitiesModel!.name ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Count: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            provider.amenitiesModel!.count.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "CustomId: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            provider.amenitiesModel!.customId ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Description: ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            provider.amenitiesModel!.description ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
