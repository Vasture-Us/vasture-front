import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vasture/core/constants/app_constants.dart';
import 'package:vasture/presentation/components/button/bounced_animation_button.dart';
import 'package:vasture/presentation/providers/user_provider.dart';
import 'package:vasture/presentation/utils/routes/app_router.dart';
import 'package:vasture/presentation/utils/theme/app_text_styles.dart';

import '../../utils/theme/app_colors.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Future<void> _deleteUserData(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Data'),
        content: const Text(
          '本当にあなたはアカウントを消してしまわれるのですか？寂しくなりますね。',
        ),
        backgroundColor: AppColors.background,
        actions: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateColor.resolveWith(
                  (states) => AppColors.textPrimary),
              overlayColor:
                  WidgetStateColor.resolveWith((states) => Colors.transparent),
            ),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ButtonStyle(
              overlayColor:
                  WidgetStateColor.resolveWith((states) => Colors.transparent),
              foregroundColor: WidgetStateColor.resolveWith(
                  (states) => const Color(0xFFAE4141)),
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      final userId = ref.read(userProvider).user?.id;
      await ref.read(userProvider.notifier).deleteUserById(userId ?? '');

      if (context.mounted) {
        const IntroductionScreenRoute().push(context);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        animateColor: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Settings',
          style: AppTextStyles.headlineSmall,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _SettingsSection(
            title: 'Support',
            items: [
              _SettingsItem(
                icon: LucideIcons.forward,
                title: 'Send Feedback',
                onTap: () => _launchUrl('https://forms.gle/M9yi6dGvEbiWxDYN6'),
              ),
            ],
          ),
          const Gap(32),
          _SettingsSection(
            title: 'Legal',
            items: [
              _SettingsItem(
                icon: LucideIcons.shield,
                title: 'Privacy Policy',
                onTap: () => _launchUrl(AppConstants.privacyPolicyUrl),
              ),
              _SettingsItem(
                icon: LucideIcons.file,
                title: 'Terms of Service',
                onTap: () => _launchUrl(AppConstants.termsOfServiceUrl),
              ),
            ],
          ),
          const Gap(32),
          _SettingsSection(
            title: 'Data',
            items: [
              _SettingsItem(
                icon: LucideIcons.trash,
                title: 'Delete All Data',
                onTap: () => _deleteUserData(context, ref),
                isDestructive: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<_SettingsItem> items;

  const _SettingsSection({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: AppTextStyles.labelLarge,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: items.map((item) => item).toList().expand((item) sync* {
              yield item;
              if (item != items.last) {
                yield const Divider(height: 1, indent: 56);
              }
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? Colors.red : AppColors.textPrimary;

    return BouncedAnimationButton(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
            color: color,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: color.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
