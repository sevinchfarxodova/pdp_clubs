import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/data/my_service.dart';
import 'package:pdp_clubs/src/data/models/club_model.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/widgets/comments_button.dart';
import '../../../constants/colors.dart';

class ClubDetailsPage extends StatefulWidget {
  final Club club;

  const ClubDetailsPage({required this.club, super.key});

  @override
  State<ClubDetailsPage> createState() => _ClubDetailsPageState();
}

class _ClubDetailsPageState extends State<ClubDetailsPage> {
  List<String> localComments = [];
  final TextEditingController _commentController = TextEditingController();
  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _fetchLatestComments();
  }

  Future<void> _fetchLatestComments() async {
    try {
      Club updatedClub = await ApiService.fetchClubDetails(widget.club.id);
      setState(() {
        localComments = List.from(updatedClub.comment);
      });
    } catch (e) {
      print("Error fetching comments: $e");
    }
  }

  Future<void> addComment() async {
    if (_commentController.text.isEmpty) return;

    setState(() => isSubmitting = true);

    try {
      await ApiService.addComment(widget.club.id, _commentController.text);

      setState(() {
        localComments.add(_commentController.text);
      });
      _commentController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Comment added successfully!")),
      );

      _fetchLatestComments();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error adding comment: $e")),
      );
    } finally {
      setState(() => isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.club.clubName,
            style: const TextStyle(
              color: AppColors.blue,
              fontSize: 20,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8,
          children: [
            //photo
            Center(
              child: ClipRRect(
                child: Image.network(
                  widget.club.img!,
                  width: 300,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              widget.club.desc,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            //director,date
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Invited date: 8.02.2025',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                Text(
                  'Director: Dilafruz Aliyeva',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
            CommentsButton(
              club: widget.club,
              addComment: addComment,
              controller: _commentController,
              isSubmitting: isSubmitting,
            ),
            // Show Comments
            const Text(
              "Comments:",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.yellow,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: localComments.isEmpty
                  ? const Center(
                      child: Text(
                      "No comments yet.",
                      style: TextStyle(fontSize: 12),
                    ))
                  : ListView.builder(
                      itemCount: localComments.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: ListTile(
                            title: Text(
                              localComments[index],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),

            // ariza yuborish
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 200, vertical: 16),
                elevation: 3,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          "Confirmation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                              fontSize: 18),
                        ),
                      ),
                      content: Text(
                          "Are you sure you want to send your application?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel",
                              style: TextStyle(color: Colors.red)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Yes",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                "Send application",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
