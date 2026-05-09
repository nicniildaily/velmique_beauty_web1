import 'package:flutter/material.dart';
import '../core/theme.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'We\'d love to hear from you. Send us a message and we\'ll respond as soon as possible.',
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            if (_isSubmitted)
              _buildSuccessMessage()
            else
              _buildContactForm(),
            const SizedBox(height: 40),
            _buildContactInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.check_circle_rounded, color: AppColors.primary, size: 48),
          const SizedBox(height: 16),
          const Text(
            'Message Sent!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Thank you for contacting us. We\'ll get back to you soon.',
            style: TextStyle(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () => setState(() => _isSubmitted = false),
            child: const Text('Send another message'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name', prefixIcon: Icon(Icons.person_outline)),
              validator: (value) => value == null || value.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value == null || value.isEmpty ? 'Please enter your email' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Message', prefixIcon: Icon(Icons.message_outlined), alignLabelWithHint: true),
              maxLines: 5,
              validator: (value) => value == null || value.isEmpty ? 'Please enter your message' : null,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Send Message'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitted = true);
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  Widget _buildContactInfo() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Other Ways to Reach Us',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          _buildInfoRow(Icons.email_outlined, 'Email', 'support@velmique.co.ke'),
          const SizedBox(height: 20),
          _buildSocialRow(),
          const SizedBox(height: 32),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on_outlined, color: AppColors.primary, size: 40),
                  SizedBox(height: 8),
                  Text(
                    'Map Placeholder',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  Text(
                    'Kenya',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Our support team is available Mon-Fri, 9AM-6PM EAT.',
            style: TextStyle(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialRow() {
    return Row(
      children: [
        const Text('Social: ', style: TextStyle(color: AppColors.textSecondary)),
        const SizedBox(width: 8),
        _socialIcon(Icons.facebook),
        _socialIcon(Icons.camera_alt_outlined),
        _socialIcon(Icons.tiktok),
        _socialIcon(Icons.alternate_email),
      ],
    );
  }

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Icon(icon, color: AppColors.textSecondary, size: 24),
    );
  }
}