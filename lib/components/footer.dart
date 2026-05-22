import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _brandPurple = Color.fromARGB(255, 87, 1, 119);
const _brandAccent = Color.fromARGB(255, 176, 30, 229);

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [_brandPurple, _brandAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Column(
              children: [
                //Image.asset('assets/images/logo.png', height: 50, fit: BoxFit.contain),
                //const SizedBox(height: 16),
                _buildNavLinks(context),
                const SizedBox(height: 20),
                // _buildSocialIcons(),
                /* const SizedBox(height: 20),
                Container(height: 1, color: Colors.white.withValues(alpha: 0.2)),
                const SizedBox(height: 16), */
                Text(
                  '© 2026 Velmique Beauty. All rights reserved.',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavLinks(BuildContext context) {
    final navItems = [
      ('Home', '/'),
      ('Download', '/download'),
      ('Privacy Policy', '/privacy-policy'),
      ('Terms of Use', '/terms-of-use'),
      ('Contact', '/contact'),
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 32,
      runSpacing: 16,
      children: navItems.map((item) {
        return InkWell(
          onTap: () => context.go(item.$2),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(item.$1, style: const TextStyle(color: Colors.white, fontSize: 14)),
          ),
        );
      }).toList(),
    );
  }

  /*  Widget _buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _socialIcon(Icons.facebook),
        const SizedBox(width: 16),
        _socialIcon(Icons.camera_alt_outlined),
        const SizedBox(width: 16),
        _socialIcon(Icons.tiktok),
        const SizedBox(width: 16),
        _socialIcon(Icons.alternate_email),
      ],
    );
  } */

  /* Widget _socialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(50)),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  } */
}
