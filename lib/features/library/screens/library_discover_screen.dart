import 'package:flutter/material.dart';
import 'package:libconnect/core/theme/app_theme.dart';

class LibraryDiscoverScreen extends StatefulWidget {
  const LibraryDiscoverScreen({super.key});

  @override
  State<LibraryDiscoverScreen> createState() => _LibraryDiscoverScreenState();
}

class _LibraryDiscoverScreenState extends State<LibraryDiscoverScreen> {
  String selectedFilter = 'Nearby';
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> libraries = [
    {
      'name': 'Central City',
      'description': 'Classic literature and weekly events.',
      'members': '1.2k',
      'image': 'assets/images/library1.jpg',
      'category': 'Academic',
      'color': const Color(0xFF8B7355),
      'icon': Icons.menu_book_rounded,
    },
    {
      'name': 'The Fiction Hub',
      'description': 'Global bestsellers and fiction novels.',
      'members': '850',
      'image': 'assets/images/library2.jpg',
      'category': 'Fiction',
      'color': const Color(0xFFD4A574),
      'icon': Icons.auto_stories,
    },
    {
      'name': 'Westside Library',
      'description': 'Research papers and academic journals.',
      'members': '2.1k',
      'image': 'assets/images/library3.jpg',
      'category': 'Academic',
      'color': const Color(0xFF6B5B3A),
      'icon': Icons.school,
    },
    {
      'name': 'Community Hub',
      'description': 'Local history and community stories.',
      'members': '430',
      'image': 'assets/images/library4.jpg',
      'category': 'Fiction',
      'color': const Color(0xFFB8956A),
      'icon': Icons.groups,
    },
    {
      'name': 'Tech Library',
      'description': 'Programming and technology resources.',
      'members': '1.5k',
      'image': 'assets/images/library5.jpg',
      'category': 'Academic',
      'color': const Color(0xFF4A90E2),
      'icon': Icons.computer,
    },
    {
      'name': 'Kids Corner',
      'description': 'Children\'s books and learning materials.',
      'members': '920',
      'image': 'assets/images/library6.jpg',
      'category': 'Fiction',
      'color': const Color(0xFFFF6B9D),
      'icon': Icons.child_care,
    },
  ];

  List<Map<String, dynamic>> get filteredLibraries {
    if (selectedFilter == 'Nearby' || selectedFilter == 'Popular' || selectedFilter == 'New') {
      return libraries;
    }
    return libraries.where((lib) => lib['category'] == selectedFilter).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover Libraries',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or city...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 15,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear, size: 20),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                    });
                  },
                )
                    : null,
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),

          // Filter Chips
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(
                    'Nearby',
                    Icons.near_me,
                    isSelected: selectedFilter == 'Nearby',
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Academic',
                    Icons.school,
                    isSelected: selectedFilter == 'Academic',
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Fiction',
                    Icons.book,
                    isSelected: selectedFilter == 'Fiction',
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Popular',
                    Icons.trending_up,
                    isSelected: selectedFilter == 'Popular',
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'New',
                    Icons.new_releases_outlined,
                    isSelected: selectedFilter == 'New',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Section Title with count
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Text(
                  'Featured Libraries',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${filteredLibraries.length}',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Libraries Grid
          Expanded(
            child: filteredLibraries.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.library_books_outlined,
                      size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text(
                    'No libraries found',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemCount: filteredLibraries.length,
                padding: const EdgeInsets.only(bottom: 16),
                itemBuilder: (context, index) {
                  return _LibraryCard(
                    library: filteredLibraries[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon,
      {bool isSelected = false}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: AppTheme.primaryColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : Colors.black87,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LibraryCard extends StatelessWidget {
  final Map<String, dynamic> library;

  const _LibraryCard({required this.library});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to library details
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Library Image with fallback
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (library['color'] as Color).withOpacity(0.8),
                      library['color'] as Color,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    // Pattern overlay
                    Opacity(
                      opacity: 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(library['image']),
                            fit: BoxFit.cover,
                            onError: (exception, stackTrace) {},
                          ),
                        ),
                      ),
                    ),
                    // Icon
                    Center(
                      child: Icon(
                        library['icon'] as IconData,
                        size: 48,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    // Category badge
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          library['category'],
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: library['color'] as Color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Library Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      library['name'],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      library['description'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.people_outline,
                          size: 15,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${library['members']} members',
                          style:
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey.shade600,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Join Button
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Show join confirmation
                    _showJoinDialog(context, library['name']);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Join',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showJoinDialog(BuildContext context, String libraryName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Join Library'),
          content: Text('Would you like to join $libraryName?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Successfully joined $libraryName!'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Join'),
            ),
          ],
        );
      },
    );
  }
}