import 'package:flutter/material.dart';
import 'about_screen.dart';
import '../widgets/counter_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get the current orientation and screen size
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    final isLandscape = orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nimbus', style: TextStyle(color: Colors.brown.shade700)),
        backgroundColor: const Color.fromARGB(255, 244, 159, 182),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.brown),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.brown),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: isLandscape
            ? _buildLandscapeLayout(context, size)
            : _buildPortraitLayout(context, size),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 211, 182, 220),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.brown),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.brown),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_outlined, color: Colors.brown),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined, color: Colors.brown),
            label: 'Articles',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown.shade700,
        unselectedItemColor: Colors.brown.shade400,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutScreen()),
            );
          }
        },
      ),
    );
  }

  // Portrait mode layout
  Widget _buildPortraitLayout(BuildContext context, Size size) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildWelcomeSection(context),
        const SizedBox(height: 20),
        _buildMoodTracker(context),
        const SizedBox(height: 24),
        _buildJournalSection(context),
        const SizedBox(height: 24),
        _buildArticlesSection(context),
        const SizedBox(height: 24),
        Center(child: CounterButton()),
      ],
    );
  }

  // Landscape mode layout
  Widget _buildLandscapeLayout(BuildContext context, Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side: Welcome and Mood Tracker
        Expanded(
          flex: 1,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildWelcomeSection(context),
              const SizedBox(height: 20),
              _buildMoodTracker(context),
              const SizedBox(height: 20),
              Center(child: CounterButton()),
            ],
          ),
        ),
        // Right side: Journal and Articles
        Expanded(
          flex: 1,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildJournalSection(context),
              const SizedBox(height: 20),
              _buildArticlesSection(context),
            ],
          ),
        ),
      ],
    );
  }

  // Welcome section with user greeting and date
  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 244, 159, 182), Color.fromARGB(255, 120, 60, 130)],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hello, Sarah',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white.withOpacity(0.3),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Tuesday, April 8, 2025',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'How are you feeling today?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Mood tracker section
  Widget _buildMoodTracker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Track Your Mood',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.brown.shade700,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildMoodItem('Great', Icons.sentiment_very_satisfied, Colors.green),
              _buildMoodItem('Good', Icons.sentiment_satisfied, Colors.lightGreen),
              _buildMoodItem('Okay', Icons.sentiment_neutral, Colors.amber),
              _buildMoodItem('Down', Icons.sentiment_dissatisfied, Colors.orange),
              _buildMoodItem('Bad', Icons.sentiment_very_dissatisfied, Colors.red),
              _buildMoodItem('Anxious', Icons.whatshot, Colors.purple),
              _buildMoodItem('Tired', Icons.bedtime, Colors.indigo),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 211, 182, 220).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.timeline, color: Colors.brown.shade700),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'View your mood trends over time',
                  style: TextStyle(
                    color: Colors.brown.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.brown.shade700),
            ],
          ),
        ),
      ],
    );
  }

  // Individual mood item
  Widget _buildMoodItem(String label, IconData icon, Color color) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.brown.shade800,
            ),
          ),
        ],
      ),
    );
  }

  // Journal section
  Widget _buildJournalSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Journal',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.brown.shade700,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('View All', style: TextStyle(color: Colors.brown.shade700)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 211, 182, 220),
                child: Icon(
                  Icons.edit,
                  color: Colors.brown.shade700,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Write in your journal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.brown.shade800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Record your thoughts and feelings',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.brown.shade700,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  index == 0 ? 'Finding peace in small moments' : 'Reflections on growth',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  index == 0 ? 'Yesterday, 8:30 PM' : 'April 6, 2:15 PM',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              );
            },
          ),
        ),
      ],
    );
  }

  // Articles section
  Widget _buildArticlesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Articles for You',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.brown.shade700,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Browse All', style: TextStyle(color: Colors.brown.shade700)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildArticleCard(
                'Managing Anxiety in Daily Life',
                'Learn techniques to manage anxiety symptoms and build resilience.',
                'assets/anxiety.jpg',
                const Color.fromARGB(255, 120, 60, 130),
              ),
              _buildArticleCard(
                'The Power of Gratitude',
                'How practicing gratitude can improve your mental well-being.',
                'assets/gratitude.jpg',
                Colors.amber.shade700,
              ),
              _buildArticleCard(
                'Mindfulness for Beginners',
                'Simple mindfulness exercises to incorporate into your daily routine.',
                'assets/mindfulness.jpg',
                Colors.purple.shade300,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Individual article card
  Widget _buildArticleCard(String title, String description, String imagePath, Color color) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              color: color.withOpacity(0.3),
            ),
            child: Center(
              child: Icon(
                _getIconForArticle(title),
                size: 50,
                color: color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.brown.shade800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get icon for article
  IconData _getIconForArticle(String title) {
    if (title.contains('Anxiety')) {
      return Icons.healing;
    } else if (title.contains('Gratitude')) {
      return Icons.favorite;
    } else if (title.contains('Mindfulness')) {
      return Icons.self_improvement;
    } else {
      return Icons.article;
    }
  }
}