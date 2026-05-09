import 'package:flutter/material.dart';
import '../core/theme.dart';

class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool outlined;
  final bool isSmall;
  final Color? color;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.color,
    this.outlined = false,
    this.isSmall = false,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isHovered = false;
  static const _brandPurple = Color.fromARGB(255, 87, 1, 119);
  static const _brandAccent = Color.fromARGB(255, 176, 30, 229);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
        child: widget.outlined
            ? OutlinedButton(
                onPressed: widget.onPressed,
                style: OutlinedButton.styleFrom(
                  foregroundColor: _brandPurple,
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.isSmall ? 20 : 28,
                    vertical: widget.isSmall ? 12 : 16,
                  ),
                  side: BorderSide(color: _isHovered ? _brandAccent : _brandPurple, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _buildContent(),
              )
            : ElevatedButton(
                onPressed: widget.onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isHovered ? _brandAccent : _brandPurple,
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.isSmall ? 20 : 28,
                    vertical: widget.isSmall ? 12 : 16,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _buildContent(),
              ),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(widget.icon, size: widget.isSmall ? 18 : 22),
          const SizedBox(width: 8),
          Text(widget.label),
        ],
      );
    }
    return Text(widget.label);
  }
}

class GooglePlayButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isSmall;

  const GooglePlayButton({super.key, this.label = 'Get it on Google Play', this.onPressed, this.isSmall = false});

  @override
  State<GooglePlayButton> createState() => _GooglePlayButtonState();
}

class _GooglePlayButtonState extends State<GooglePlayButton> {
  bool _isHovered = false;
  static const _brandPurple = Color.fromARGB(255, 87, 1, 119);
  static const _brandAccent = Color.fromARGB(255, 176, 30, 229);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.03 : 1.0),
        child: ElevatedButton.icon(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isHovered ? _brandAccent : _brandPurple,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: widget.isSmall ? 20 : 28, vertical: widget.isSmall ? 12 : 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          icon: Icon(Icons.play_arrow_rounded, size: widget.isSmall ? 22 : 26),
          label: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'GET IT ON',
                style: TextStyle(fontSize: widget.isSmall ? 8 : 10, fontWeight: FontWeight.w500, letterSpacing: 0.5),
              ),
              Text(
                widget.label,
                style: TextStyle(fontSize: widget.isSmall ? 14 : 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  const GradientCard({super.key, required this.child, this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(padding: padding ?? const EdgeInsets.all(24), child: child),
        ),
      ),
    );
  }
}

class FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final int index;

  const FeatureCard({super.key, required this.icon, required this.title, required this.description, this.index = 0});

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -8.0 : 0.0),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? AppColors.primary.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.05),
                blurRadius: _isHovered ? 20 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.icon, color: AppColors.primary, size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                widget.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 8),
              Text(widget.description, style: TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.5)),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneMockup extends StatelessWidget {
  final Widget child;
  final double height;

  const PhoneMockup({super.key, required this.child, this.height = 400});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height * 0.45,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(borderRadius: BorderRadius.circular(20), child: child),
        ),
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget child;
  final bool darkBackground;

  const SectionContainer({super.key, this.title, this.subtitle, required this.child, this.darkBackground = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBackground ? const Color(0xFF1A1A2E) : AppColors.background,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (title != null) ...[
              Text(
                title!,
                style: TextStyle(
                  fontSize: isMobile(context) ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: darkBackground ? Colors.white : AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
            if (subtitle != null) ...[
              Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 16,
                  color: darkBackground ? Colors.white.withValues(alpha: 0.7) : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
            ],
            child,
          ],
        ),
      ),
    );
  }

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 768;
}
