import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _brandPurple = Color.fromARGB(255, 87, 1, 119);
const _brandAccent = Color.fromARGB(255, 176, 30, 229);

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool _isScrolled = false;
  bool _isMobileMenuOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkScroll();
    });
  }

  void _checkScroll() {
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset > 50 && !_isScrolled) {
        setState(() => _isScrolled = true);
      } else if (scrollController.offset <= 50 && _isScrolled) {
        setState(() => _isScrolled = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).matchedLocation;
    final mobile = MediaQuery.of(context).size.width < 768;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _isScrolled
              ? [_brandPurple.withValues(alpha: 0.98), _brandAccent.withValues(alpha: 0.98)]
              : [_brandPurple, _brandAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: _isScrolled
            ? [BoxShadow(color: _brandPurple.withValues(alpha: 0.4), blurRadius: 20, offset: Offset(0, 4))]
            : null,
      ),
      child: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 24, vertical: 12),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => context.go('/'),
                child: Image.asset('assets/images/logo.png', height: 80, fit: BoxFit.contain),
              ),
              const Spacer(),
              if (!mobile) _buildNavLinks(currentPath) else _buildMobileMenu(currentPath),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavLinks(String currentPath) {
    final navItems = [
      ('Home', '/'),
      ('Download', '/download'),
      ('Privacy Policy', '/privacy-policy'),
      ('Terms of Use', '/terms-of-use'),
      ('Contact', '/contact'),
    ];

    return Row(
      children: navItems.map((item) {
        final isActive = currentPath == item.$2;
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: InkWell(
            onTap: () => context.go(item.$2),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isActive ? Colors.white.withValues(alpha: 0.25) : Colors.white.withValues(alpha: 0.1),
              ),
              child: Text(
                item.$1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileMenu(String currentPath) {
    return Column(
      children: [
        IconButton(
          icon: Icon(_isMobileMenuOpen ? Icons.close : Icons.menu, color: Colors.white, size: 32),
          onPressed: () => setState(() => _isMobileMenuOpen = !_isMobileMenuOpen),
        ),
        if (_isMobileMenuOpen) ...[
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: _brandPurple,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 20)],
            ),
            child: Column(
              children: [
                _mobileNavItem('Home', '/', currentPath),
                _mobileNavItem('Download', '/download', currentPath),
                _mobileNavItem('Privacy Policy', '/privacy-policy', currentPath),
                _mobileNavItem('Terms of Use', '/terms-of-use', currentPath),
                _mobileNavItem('Contact', '/contact', currentPath),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _mobileNavItem(String label, String path, String currentPath) {
    final isActive = currentPath == path;
    return InkWell(
      onTap: () {
        context.go(path);
        setState(() => _isMobileMenuOpen = false);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withValues(alpha: 0.15) : null,
          border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: isActive ? FontWeight.w600 : FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}
