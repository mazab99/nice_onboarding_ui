part of 'text_with_button_and_indicator.dart';

class _MainText extends StatelessWidget {
  const _MainText({
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            getCurrentTitle(currentIndex),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Text(
              getCurrentSubtext(currentIndex),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color:Colors.black.withOpacity(0.4),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
