import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../core/theme.dart';
import '../components/common_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeroSection(),
          const AboutSection(),
          const HowItWorksSection(),
          const FeaturesSection(),
          const TestimonialsSection(),
          const DownloadCtaSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: EdgeInsets.fromLTRB(24, isMobile ? 40 : 60, 24, 80),
      child: isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/promo1.png',
          height: 280,
          fit: BoxFit.contain,
        ).animate().fadeIn(duration: 600.ms).scale(begin: const Offset(0.9, 0.9)),
        const SizedBox(height: 32),
        Text(
          'Upgrade your beauty shopping experience with Velmique Beauty.',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary, height: 1.3),
          textAlign: TextAlign.center,
        ).animate().fadeIn(delay: 200.ms),
        const SizedBox(height: 16),
        Text(
          'Discover trusted beauty vendors, easy browsing, and secure shopping in Kenya\'s premium beauty marketplace.',
          style: const TextStyle(fontSize: 15, color: AppColors.textSecondary, height: 1.5),
          textAlign: TextAlign.center,
        ).animate().fadeIn(delay: 300.ms),
        const SizedBox(height: 32),
        _buildButtons().animate().fadeIn(delay: 400.ms),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upgrade your beauty shopping experience with Velmique Beauty.',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  height: 1.2,
                ),
              ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1),
              const SizedBox(height: 20),
              Text(
                'Discover trusted beauty vendors, easy browsing, and secure shopping in Kenya\'s premium beauty marketplace. Beauty delivered conveniently.',
                style: const TextStyle(fontSize: 18, color: AppColors.textSecondary, height: 1.6),
              ).animate().fadeIn(delay: 200.ms),
              const SizedBox(height: 40),
              _buildButtons().animate().fadeIn(delay: 300.ms),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: Image.asset(
            'assets/images/promo1.png',
            height: 450,
            fit: BoxFit.contain,
          ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.8, 0.8)),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        const GooglePlayButton(label: 'Google Play'),
        PrimaryButton(label: 'Download APK', icon: Icons.download_rounded),
      ],
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'What is Velmique?',
      subtitle: 'Solving beauty shopping challenges in Kenya',
      child: Column(children: [_buildProblemSolutionRow()]),
    );
  }

  Widget _buildProblemSolutionRow() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 24,
      runSpacing: 24,
      children: [
        _buildCard(
          'The Problem',
          'Difficulty finding trusted beauty products in Kenya, scattered sellers, fake products, and inconvenient shopping experience.',
          Icons.warning_amber_rounded,
          AppColors.primary,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text('➜', style: TextStyle(fontSize: 24, color: AppColors.accent)),
        ),
        _buildCard(
          'The Solution',
          'Velmique connects you with trusted beauty vendors, easy browsing, secure shopping, and beauty delivered conveniently to your door.',
          Icons.check_circle_rounded,
          AppColors.accent,
        ),
      ],
    );
  }

  Widget _buildCard(String title, String content, IconData icon, Color color) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 320),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.15), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(height: 12),
          Text(content, style: const TextStyle(fontSize: 15, color: AppColors.textSecondary, height: 1.5)),
        ],
      ),
    );
  }
}

class HowItWorksSection extends StatefulWidget {
  const HowItWorksSection({super.key});

  @override
  State<HowItWorksSection> createState() => _HowItWorksSectionState();
}

class _HowItWorksSectionState extends State<HowItWorksSection> {
  int _selectedStep = 0;

  final _steps = [
    {
      'title': 'Browse Products',
      'desc': 'Explore skincare, makeup, haircare, and wellness essentials from trusted sellers.',
      'image': 'assets/images/screen_1.png',
    },
    {
      'title': 'Add to Cart & Checkout',
      'desc': 'Select your items, review your cart, and complete secure payment.',
      'image': 'assets/images/screen_2.png',
    },
    {
      'title': 'Chat with Seller',
      'desc': 'message sellers directly, ask questions, and confirm orders.',
      'image': 'assets/images/screen_3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'How It Works',
      subtitle: 'Get started in 3 simple steps',
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: List.generate(3, (index) => _buildStepButton(index)),
          ),
          const SizedBox(height: 40),
          _buildSelectedScreen(),
        ],
      ),
    );
  }

  Widget _buildStepButton(int index) {
    final isSelected = _selectedStep == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedStep = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.divider),
          boxShadow: isSelected ? [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 12)] : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : AppColors.primary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: isSelected ? AppColors.primary : Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              _steps[index]['title']!,
              style: TextStyle(color: isSelected ? Colors.white : AppColors.textPrimary, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedScreen() {
    final step = _steps[_selectedStep];
    return GestureDetector(
      onTap: () => _showImageDialog(step['image']!, step['title']!),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 20, offset: const Offset(0, 10)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Column(
                children: [
                  AspectRatio(aspectRatio: 0.45, child: Image.asset(step['image']!, fit: BoxFit.cover)),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          step['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          step['desc']!,
                          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showImageDialog(String imagePath, String title) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: const Color(0xFF1A1A2E), borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(4),
              child: ClipRRect(borderRadius: BorderRadius.circular(14), child: Image.asset(imagePath)),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Features',
      subtitle: 'Everything you need for a seamless beauty shopping experience',
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          FeatureCard(
            icon: Icons.verified_user_rounded,
            title: 'Trusted Sellers',
            description: 'Every seller is vetted for quality and authenticity.',
          ),
          FeatureCard(
            icon: Icons.local_shipping_rounded,
            title: 'Fast Delivery',
            description: 'Get your beauty essentials delivered quickly.',
          ),
          FeatureCard(
            icon: Icons.payment_rounded,
            title: 'Easy Payments',
            description: 'Secure mobile money & card payments.',
          ),
          FeatureCard(
            icon: Icons.category_rounded,
            title: 'Product Categories',
            description: 'Skincare, makeup, haircare & more.',
          ),
          FeatureCard(icon: Icons.favorite_rounded, title: 'Wishlist', description: 'Save items for later purchase.'),
          FeatureCard(icon: Icons.lock_rounded, title: 'Secure Checkout', description: 'Safe transactions every time.'),
        ],
      ),
    );
  }
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'What Our Customers Say',
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          _testimonialCard(
            'Sarah M.',
            'Nairobi',
            'Velmique made it so easy to find quality skincare products. Love the instant chat with sellers!',
            5,
          ),
          _testimonialCard(
            'Amara K.',
            'Mombasa',
            'Fast delivery and authentic products. My go-to app for all beauty needs now.',
            5,
          ),
          _testimonialCard(
            'Faith W.',
            'Kisumu',
            'The secure checkout gives me confidence. Found my holy graial makeup brands here!',
            5,
          ),
        ],
      ),
    );
  }

  Widget _testimonialCard(String name, String location, String text, int rating) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: List.generate(5, (i) => Icon(Icons.star, color: AppColors.accent, size: 18))),
          const SizedBox(height: 12),
          Text(
            '"$text"',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                child: Text(
                  name[0],
                  style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  Text(location, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DownloadCtaSection extends StatelessWidget {
  const DownloadCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const Text(
            'Ready to Upgrade Your Beauty Shopping?',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Download Velmique Beauty today and discover your new favorite beauty marketplace.',
            style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.9)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              const GooglePlayButton(label: 'Google Play'),
              ElevatedButton.icon(
                onPressed: () => context.go('/download'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.download_rounded),
                label: const Text('Download APK'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
