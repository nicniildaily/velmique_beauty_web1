import 'package:flutter/material.dart';
import '../core/theme.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Last updated: May 2026',
              style: TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            _buildSection('Introduction', 'Velmique Beauty ("we", "our", or "us") respects your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application and website.'),
            _buildSection('Information We Collect', 'We may collect personal information that you voluntarily provide to us when you register on the App, express interest in obtaining information about us or our products, or otherwise contact us. This includes name, phone number, email address, and payment information.'),
            _buildSection('How We Use Your Information', 'We use your information to: Provide and improve our services, Process your transactions, Send you technical notices and support messages, Communicate with you about products, services, and events, Monitor and analyze trends and usage'),
            _buildSection('Sharing Your Information', 'We do not sell, trade, or otherwise transfer your personal information to outside parties except as described in this policy. We may share information with service providers who assist us in operating our app.'),
            _buildSection('Data Security', 'We implement appropriate technical and organizational security measures to protect your personal information. However, no method of transmission over the Internet is 100% secure.'),
            _buildSection('Your Rights', 'You have the right to access, correct, or delete your personal information. Contact us to exercise these rights.'),
            _buildSection('Changes to This Policy', 'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page.'),
            _buildSection('Contact Us', 'If you have questions about this Privacy Policy, please contact us at support@velmique.co.ke'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}