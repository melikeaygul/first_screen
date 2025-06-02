import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool isProfileSelected = true;

  final List<String> profileImages = [
    'https://picsum.photos/id/342/200/300',
    'https://picsum.photos/id/132/200/300',
    'https://picsum.photos/id/413/200/300',
    'https://picsum.photos/id/234/200/300',
    'https://picsum.photos/id/434/200/300',
    'https://picsum.photos/id/264/200/300',
  ];

  final List<String> favoriteImages = [
    'https://picsum.photos/id/380/200/300',
    'https://picsum.photos/id/572/200/300',
    'https://picsum.photos/id/773/200/300',
    'https://picsum.photos/id/471/200/300',
    'https://picsum.photos/id/324/200/300',
  ];

  @override
  Widget build(BuildContext context) {
    final selectedImages = isProfileSelected ? profileImages : favoriteImages;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/id/410/200/300',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Lara Lenz',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '28 y.o.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Mode ist meine Leidenschaft, folge\nmir und lasse dich inspirieren.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildTabButton('Profil', true),
                _buildTabButton('Favoriten', false),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Bild-Gitter
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: selectedImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      selectedImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildTabButton(String label, bool profileTab) {
    final isSelected = isProfileSelected == profileTab;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isProfileSelected = profileTab;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
