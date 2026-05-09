import 'package:flutter/material.dart';
import '../core/theme.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

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
              'Terms of Use',
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
            _buildSection('Acceptance of Terms', 'By accessing and using Velmique Beauty mobile application, you accept and agree to be bound by the terms and provision of this agreement.'),
            _buildSection('Use License', 'Permission is granted to temporarily use Velmique Beauty app for personal, non-commercial transitory viewing only.'),
            _buildSection('User Account', 'You are responsible for maintaining the confidentiality of your account and password. You agree to accept responsibility for all activities that occur under your account.'),
            _buildSection('Product Information', 'We strive to provide accurate product descriptions and pricing. However, we do not warrant that product descriptions or pricing are accurate, complete, or current.'),
            _buildSection('Orders and Payments', 'We reserve the right to refuse any order you place with us. Payment must be completed through the available payment methods on the platform.'),
            _buildSection('Seller Terms', 'Sellers on our platform agree to only list authentic products and fulfill orders promptly. We may remove sellers who violate our policies.'),
            _buildSection('Limitation of Liability', 'Velmique Beauty shall not be liable for any damages arising out of the use or inability to use the app, even if we have been advised of such possibilities.'),
            _buildSection('Governing Law', 'These terms and conditions are governed by and construed in accordance with the laws of Kenya.'),
            _buildSection('Changes to Terms', 'We reserve the right to modify these terms at any time. Your continued use of the app constitutes acceptance of any changes.'),
            _buildSection('Contact Information', 'For questions about these Terms of Use, please contact us at support@velmique.co.ke'),
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