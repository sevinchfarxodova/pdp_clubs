import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/data/my_service.dart';
import 'package:pdp_clubs/src/data/models/club_model.dart';

class ClubDetailsPage extends StatefulWidget {
  final Club club;

  const ClubDetailsPage({required this.club, super.key});

  @override
  State<ClubDetailsPage> createState() => _ClubDetailsPageState();
}

class _ClubDetailsPageState extends State<ClubDetailsPage> {
  final TextEditingController _commentController = TextEditingController();
  bool isSubmitting = false;
  List<String> localComments = [];

  @override
  void initState() {
    super.initState();
    _fetchLatestComments();
  }

  Future<void> _fetchLatestComments() async {
    try {
      Club updatedClub = await ApiService.fetchClubDetails(widget.club.id);
      setState(() {
        localComments = updatedClub.comment; // Update comments in UI
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
      appBar: AppBar(title: Text(widget.club.clubName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.club.img!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(widget.club.desc, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 24),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: "Write a comment...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: isSubmitting ? null : addComment,
              child: isSubmitting
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Add Comment"),
            ),

            // Show Comments
            const SizedBox(height: 20),
            Text(
              "Comments:",
            ),
            Expanded(
              child: localComments.isEmpty
                  ? const Center(child: Text("No comments yet."))
                  : ListView.builder(
                      itemCount: localComments.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text(localComments[index]),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
