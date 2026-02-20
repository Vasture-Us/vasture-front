import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:vasture/presentation/components/button/bounced_animation_button.dart';
import 'package:vasture/presentation/components/shimmer/flexible_shimmer_container.dart';
import 'package:vasture/presentation/utils/routes/app_router.dart';
import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_text_styles.dart';
import '../../providers/user_provider.dart';
import '../../providers/photo_provider.dart';

class PhotoScreen extends HookConsumerWidget {
  final String date;

  const PhotoScreen({super.key, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoState = ref.watch(photoProvider);
    final photos = photoState.photos;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final userId = ref.read(userProvider).user?.id;
        if (userId != null) {
          final parsedDate = DateFormat('MMMM yyyy').parse(date);
          await ref.read(photoProvider.notifier).loadPhotosByMonth(
                userId,
                parsedDate.year,
                parsedDate.month,
              );
        }
      });

      return null;
    }, []);

    Widget buildShimmerPlaceholders() {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Wrap(
            spacing: 16,
            runAlignment: WrapAlignment.spaceBetween,
            runSpacing: 16.0,
            children: List.generate(
              8,
              (_) => FlexibleShimmerContainer(
                width: MediaQuery.of(context).size.width / 2.4,
                height: 200,
                radius: 24,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        animateColor: false,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(LucideIcons.arrowLeft),
        ),
        title: Text(
          date,
          style: AppTextStyles.headlineSmall,
        ),
      ),
      body: photoState.isLoading
          ? buildShimmerPlaceholders()
          : photos.isEmpty
              ? const Center(
                  child: Text(
                    'No photos for this month',
                    style: AppTextStyles.titleLarge,
                  ),
                )
              : MasonryGridView.count(
                  padding: const EdgeInsets.all(16),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: photos.length,
                  itemBuilder: (context, index) {
                    final photo = photos[index];
                    return BouncedAnimationButton(
                      onTap: () {
                        PhotoDetailScreenRoute(photo.id).push(context);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AspectRatio(
                              aspectRatio: 3 / 4,
                              child: CachedNetworkImage(
                                imageUrl: photo.imageUrl,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  color: Colors.grey[200],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            DateFormat('MMM d, y').format(photo.createdAt),
                            style: AppTextStyles.bodyMedium,
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
