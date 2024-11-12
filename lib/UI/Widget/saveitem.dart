import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Widget/apply.dart';
import 'package:leap/UI/Widget/bottomsheet.dart';
import 'package:leap/UI/Widget/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimplifiedInternshipPost extends StatefulWidget {
  final InternshipPost internship;

  const SimplifiedInternshipPost({
    super.key,
    required this.internship,
  });

  @override
  State<SimplifiedInternshipPost> createState() =>
      _SimplifiedInternshipPostState();
}

class _SimplifiedInternshipPostState extends State<SimplifiedInternshipPost> {
  bool isLiked = false;
  bool isShared = false;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _loadIconStates();
  }

  Future<void> _loadIconStates() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isLiked =
          prefs.getBool('${widget.internship.companyName}_liked') ?? false;
      isShared =
          prefs.getBool('${widget.internship.companyName}_shared') ?? false;
      isSaved =
          prefs.getBool('${widget.internship.companyName}_saved') ?? false;
    });
  }

  Future<void> _saveIconState(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${widget.internship.companyName}_$key', value);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    _saveIconState('liked', isLiked);
  }

  void toggleShare() {
    setState(() {
      isShared = !isShared;
    });
    _saveIconState('shared', isShared);
  }

  void toggleSave() {
    setState(() {
      isSaved = !isSaved;
    });
    _saveIconState('saved', isSaved);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showReusableBottomSheet(
          context: context,
          title: widget.internship.positionName,
          subtitle: widget.internship.companyName,
          description: widget.internship.description,
          location: widget.internship.location,
          salary: widget.internship.salary,
          skills: widget.internship.keySkills,
          onApply: widget.internship.onApply,
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Name and Location
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: widget.internship.companyLogo,
                    radius: 24,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.internship.companyName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.internship.location,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Main Image (Media)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: widget.internship.media,
              ),
              const SizedBox(height: 12),

              // Position Title
              Text(
                widget.internship.positionName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),

              // Like, Share, Save Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(isLiked
                            ? Icons.thumb_up_alt
                            : Icons.thumb_up_alt_outlined),
                        onPressed: toggleLike,
                      ),
                      IconButton(
                        icon:
                            Icon(isShared ? Icons.share : Icons.share_outlined),
                        onPressed: toggleShare,
                      ),
                      IconButton(
                        icon: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_outline),
                        onPressed: toggleSave,
                      ),
                    ],
                  ),
                  // Apply Button with Icon
                  ElevatedButton.icon(
                    onPressed: () {
                      showApplyConfirmationDialog(
                        context: context,
                        onConfirm: widget.internship.onApply,
                      );
                    },
                    icon: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? DarkMode.buttonTextColor
                          : LightMode.buttonTextColor,
                    ),
                    label: Text(
                      "Apply",
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? DarkMode.buttonTextColor
                            : LightMode.buttonTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? DarkMode.buttonBackgroundColor
                              : LightMode.buttonBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
