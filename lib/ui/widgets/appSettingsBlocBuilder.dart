import 'package:eschool/cubits/appSettingsCubit.dart';
import 'package:eschool/ui/widgets/customCircularProgressIndicator.dart';
import 'package:eschool/ui/widgets/errorContainer.dart';
import 'package:eschool/utils/uiUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppSettingsBlocBuilder extends StatelessWidget {
  final String appSettingsType;

  const AppSettingsBlocBuilder({Key? key, required this.appSettingsType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        if (state is AppSettingsFetchSuccess) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    (UiUtils.appBarSmallerHeightPercentage + 0.025)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),

                )
              ],
            ),
          );
        }
        if (state is AppSettingsFetchFailure) {
          return ErrorContainer(
            errorMessageCode: state.errorMessage,
            onTapRetry: () {
              context
                  .read<AppSettingsCubit>()
                  .fetchAppSettings(type: appSettingsType);
            },
          );
        }
        return CustomCircularProgressIndicator(
          indicatorColor: Theme.of(context).colorScheme.primary,
        );
      },
    );
  }
}
