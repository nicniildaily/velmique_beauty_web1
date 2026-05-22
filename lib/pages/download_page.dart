import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../components/common_widgets.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

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
              'Download Velmique Beauty',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Get the app and start shopping for your favorite beauty products.',
              style: const TextStyle(fontSize: 16, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Image.asset('assets/images/promo1.png', height: 500, fit: BoxFit.contain),
            const SizedBox(height: 40),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: const [
                GooglePlayButton(),
                PrimaryButton(label: 'Download APK', icon: Icons.download_rounded),
              ],
            ),
            const SizedBox(height: 60),
            _buildInstallationGuide(),
          ],
        ),
      ),
    );
  }

  Widget _buildInstallationGuide() {
    final steps = [
      {
        'icon': Icons.download_rounded,
        'title': 'Download the APK',
        'desc': 'Click the download button above to get the APK file.',
      },
      {
        'icon': Icons.folder_open_rounded,
        'title': 'Open the file',
        'desc': 'Navigate to your downloads and tap the APK file.',
      },
      {
        'icon': Icons.security_rounded,
        'title': 'Allow installation',
        'desc': 'If prompted, allow installation from unknown sources.',
      },
      {'icon': Icons.apps_rounded, 'title': 'Install & open', 'desc': 'Complete the installation and launch the app.'},
    ];

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Installation Guide',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 24),
          ...steps.asMap().entries.map((entry) => _buildStep(entry.key + 1, entry.value)),
        ],
      ),
    );
  }

  Widget _buildStep(int number, Map<String, dynamic> step) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step['title'],
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.textPrimary),
                ),
                const SizedBox(height: 4),
                Text(step['desc'], style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
