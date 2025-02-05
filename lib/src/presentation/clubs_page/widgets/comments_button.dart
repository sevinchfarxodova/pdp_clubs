import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/data/models/club_model.dart';
import '../../../../constants/colors.dart';
import '../../../data/my_service.dart';

class CommentsButton extends StatefulWidget {
  final Club club;
   CommentsButton({super.key, required this.club});

  @override
  State<CommentsButton> createState() => _CommentsButtonState();
}

class _CommentsButtonState extends State<CommentsButton> {
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
        localComments = List.from(localComments)..add(_commentController.text); // Ensures UI updates
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: "Write a comment...",
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.comment, color: AppColors.blue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            elevation: 3,
          ),
          onPressed: isSubmitting ? null : addComment,
          child: isSubmitting
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text("Add Comment", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ],
    );
  }
}

