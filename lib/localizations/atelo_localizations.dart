import 'package:flutter/material.dart';

class AteloLocalizations {
  Locale locale;

  AteloLocalizations(this.locale);

  static AteloLocalizations of(BuildContext context) {
    return Localizations.of<AteloLocalizations>(context, AteloLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'overview': 'Overview',
      'diagnostic': 'Diagnostic',
      'channel_change': 'Channel',
      'update': 'Update',
      'flutter_installation': 'Flutter Installation',
      'environment_variable': 'Environment Variable',
      'user': 'User',
      'flutter_installation_description':
          'Easy installation of Flutter on your operating system. Atelo seeks to make the installation process on your operating system as easy as possible.',
      'environment_variable_description':
          'Setting the environment variable is done during the installation process, you don\'t have to worry about that.',
      'user_description': 'No fights against root and scope difference, all actions are performed as a user!',
      'operation_system': 'Operation System',
      'hostname': 'Hostname',
      'locale': 'Locale',
      'channel': 'Channel',
      'dart': 'Dart',
      'flutter': 'Flutter',
      'checking_environment': 'Checking Environment...',
      'your_environment': 'Your Environment...',
      'your_platform': 'Your Platform...',
      'your_flutter': 'Your Flutter',
      'diagnostic_description':
          'The diagnosis of the Flutter is carried out through Flutter Doctor command. The command checks your variables and displays the installation status of your Flutter. Use this option whenever you need to validade thar everything is correct.',
      'diagnostic_log_placeholder': 'No diagnosis has been made yet, click the button below to run!',
      'donate': 'Donate',
      'atelo_version': 'Version',
      'execute_button': 'Execute',
      'flutter_channels': 'Flutter Channels',
      'channel_description':
          'Atelo is a multiplatform open-source desktop application, which aims to facilitate the installation and handling of the Flutter framework on your computer. The project is entirely built with Flutter desktop which is currently in alpha version, so therefore it is very likely that there are bugs. feedback, contribution and more information, see the official website.',
      'update_description': 'Upgrade your Flutter (the command executed for this is the Flutter upgrade).',
      'select_to_update': 'Select what you want to update and your auto update will take place next.',
      'updating_flutter': '- Updating Flutter...',
      'updating_atelo': '- Updating Atelo...',
      'update_successfully': 'Update completed successfully!',
      'atelo_update': 'Atelo update',
      'atelo_updated_successfully': 'Update completed successfully!\nAtelo will need to be restarted',
      'generic_error': 'An error has occurred!',
      'unable_change_flutter_channel': 'Couldn\'t change Flutter channel',
      'error_installing_flutter': 'Error installing Flutter.',
      'error_selecting_folder': 'Error to select folder.',
      'error_loading_flutter': 'Flutter couldn’t be loaded',
      'flutter_not_installed': 'Flutter isn’t installed',
      'flutter_command_not_found':
          'Please, check the environment variable or perform \n installation of the Flutter before carrying out the operation',
      'error_downloading_flutter': 'Error downloading Flutter, check your connection.',
      'error_flutter_exists_in_directory': 'Flutter folder already exists in the chosen directory.',
      'error_two_versions_flutter': 'There are two Flutter versions installed.',
      'wait_diagnosis': 'Wait for the diagnosis to finish...',
      'atelo_version_error': '-> It was not possible to verify a new version of Atelo.Check your connection.',
      'new_version_atelo': '-> A new version of Atelo available.',
      'no_new_version_atelo': 'No new version of the atelo',
    },
    'pt': {
      'overview': 'Visão Geral',
      'diagnostic': 'Diagnóstico',
      'channel_change': 'Mudar Canal',
      'update': 'Atualizar',
      'flutter_installation': 'Instalação do Flutter',
      'environment_variable': 'Variável de Ambiente',
      'user': 'Usuário',
      'flutter_installation_description':
          'Fácil instalação do Flutter no seu sistema operacional. O Atelo procura facilitar ao máximo o processo de instalação no seu sistema operacional.',
      'environment_variable_description':
          'A configuração da variável de ambiente é realizado durante o processo de instalação, você não precisa se preocupar com isso.',
      'user_description': 'Sem brigas com o root e diferenças de escopo, todas as ações são realizadas como usuário!',
      'operation_system': 'Sistema Operacional',
      'hostname': 'Hostname',
      'locale': 'Localidade',
      'channel': 'Canal',
      'dart': 'Dart',
      'flutter': 'Flutter',
      'checking_environment': 'Verificando ambiente...',
      'your_environment': 'Seu Ambiente...',
      'your_platform': 'Sua Plataforma...',
      'your_flutter': 'Seu Flutter',
      'diagnostic_description':
          'O diagnóstico do Flutter é realizado através do comando oficial Flutter Doctor. O comando checa suas variáveis e exibe o status da instalação do seu Flutter. Utilize essa opção sempre que precisar validar se está tudo correto.',
      'diagnostic_log_placeholder': 'Ainda não foi feito nenhuma diagnóstico, clique no botão abaixo para executar!',
      'donate': 'Contribua',
      'atelo_version': 'Versão',
      'execute_button': 'Executar',
      'flutter_channels': 'Canais Flutter',
      'channel_description':
          'Atelo é uma aplicação desktop open-source multiplataforma que tem o intuito de facilitar a instalação e manuseio do framework Flutter no seu computador. O projeto é inteiramente construído com o Flutter Desktop que atualmente está em alpha, portanto é muito provável que haja bugs. Feedback, contribuição e mais informações consulte o site oficial.',
      'update_description': 'Atualize o seu Flutter (o comando executado para isso é o flutter upgrade).',
      'select_to_update': 'Selecione o que deseja atualizar',
      'updating_flutter': '- Atualizando o Flutter...',
      'updating_atelo': '- Atualizando o Atelo...',
      'update_successfully': 'Atualização concluída com sucesso!',
      'atelo_update': 'Atualização do Atelo.',
      'atelo_updated_successfully': 'Atualização concluída com sucesso!\nSerá necessário reiniciar o Atelo.',
      'generic_error': 'Ocorreu um erro!',
      'unable_change_flutter_channel': 'Não foi possível mudar o canal do Flutter.',
      'error_installing_flutter': 'Error na instalação do Flutter.',
      'error_selecting_folder': 'Erro ao selecionar pasta.',
      'error_loading_flutter': 'Não foi possível carregar o Flutter.',
      'flutter_not_installed': 'O Flutter não está instalado',
      'flutter_command_not_found':
          'Por favor verifique a variável de ambiente ou realize\na instalação do Flutter antes de realizar a operação.',
      'error_downloading_flutter': 'Erro ao baixar o Flutter, verifique sua conexão.',
      'error_flutter_exists_in_directory': 'Já existe a pasta Flutter no diretório escolhido.',
      'error_two_versions_flutter': 'Existe duas versões do Flutter Instaladas.',
      'wait_diagnosis': 'Aguarde o diagnóstico finalizar...',
      'atelo_version_error': '-> Não foi possível verificar uma nova versão do Atelo. Verifique sua conexão.',
      'new_version_atelo': '-> Uma nova versão do Atelo está disponível.',
      'no_new_version_atelo': 'Nenhuma nova versão do Atelo.',
    }
  };

  String get overview {
    return _localizedValues[locale.languageCode]['overview'];
  }

  String get diagnostic {
    return _localizedValues[locale.languageCode]['diagnostic'];
  }

  String get channelChange {
    return _localizedValues[locale.languageCode]['channel_change'];
  }

  String get update {
    return _localizedValues[locale.languageCode]['update'];
  }

  String get flutterInstallation {
    return _localizedValues[locale.languageCode]['flutter_installation'];
  }

  String get environmentVariable {
    return _localizedValues[locale.languageCode]['environment_variable'];
  }

  String get user {
    return _localizedValues[locale.languageCode]['user'];
  }

  String get flutterInstallationDescription {
    return _localizedValues[locale.languageCode]['flutter_installation_description'];
  }

  String get environmentVariableDescription {
    return _localizedValues[locale.languageCode]['environment_variable_description'];
  }

  String get userDescription {
    return _localizedValues[locale.languageCode]['user_description'];
  }

  String get operationSystem {
    return _localizedValues[locale.languageCode]['operation_system'];
  }

  String get hostname {
    return _localizedValues[locale.languageCode]['hostname'];
  }

  String get localeText {
    return _localizedValues[locale.languageCode]['locale'];
  }

  String get channel {
    return _localizedValues[locale.languageCode]['channel'];
  }

  String get dart {
    return _localizedValues[locale.languageCode]['dart'];
  }

  String get flutter {
    return _localizedValues[locale.languageCode]['flutter'];
  }

  String get checkingEnvironment {
    return _localizedValues[locale.languageCode]['checking_environment'];
  }

  String get yourEnvironment {
    return _localizedValues[locale.languageCode]['your_environment'];
  }

  String get yourPlatform {
    return _localizedValues[locale.languageCode]['your_platform'];
  }

  String get yourFlutter {
    return _localizedValues[locale.languageCode]['your_flutter'];
  }

  String get donate {
    return _localizedValues[locale.languageCode]['donate'];
  }

  String get ateloVersion {
    return _localizedValues[locale.languageCode]['atelo_version'];
  }

  String get diagnosticDescription {
    return _localizedValues[locale.languageCode]['diagnostic_description'];
  }

  String get diagnosticLogPlaceholder {
    return _localizedValues[locale.languageCode]['diagnostic_log_placeholder'];
  }

  String get executeButton {
    return _localizedValues[locale.languageCode]['execute_button'];
  }

  String get flutterChannels {
    return _localizedValues[locale.languageCode]['flutter_channels'];
  }

  String get channelDescription {
    return _localizedValues[locale.languageCode]['channel_description'];
  }

  String get updateDescription {
    return _localizedValues[locale.languageCode]['update_description'];
  }

  String get selectToUpdate {
    return _localizedValues[locale.languageCode]['select_to_update'];
  }

  String get updatingFlutter {
    return _localizedValues[locale.languageCode]['updating_flutter'];
  }

  String get updatingAtelo {
    return _localizedValues[locale.languageCode]['updating_atelo'];
  }

  String get updateSuccessfully {
    return _localizedValues[locale.languageCode]['update_successfully'];
  }

  String get ateloUpdate {
    return _localizedValues[locale.languageCode]['atelo_update'];
  }

  String get ateloUpdatedSuccessfully {
    return _localizedValues[locale.languageCode]['atelo_updated_successfully'];
  }

  String get ateloUpdateError {
    return _localizedValues[locale.languageCode]['atelo_update_error'];
  }

  String get unableChangeFlutterChannel {
    return _localizedValues[locale.languageCode]['unable_change_flutter_channel'];
  }

  String get errorInstallingFlutter {
    return _localizedValues[locale.languageCode]['error_installing_flutter'];
  }

  String get errorSelectingFolder {
    return _localizedValues[locale.languageCode]['error_selecting_folder'];
  }

  String get errorLoadingFlutter {
    return _localizedValues[locale.languageCode]['error_loading_flutter'];
  }

  String get flutterNotInstalled {
    return _localizedValues[locale.languageCode]['flutter_not_installed'];
  }

  String get flutterCommandNotFound {
    return _localizedValues[locale.languageCode]['flutter_command_not_found'];
  }

  String get errorDownloadingFlutter {
    return _localizedValues[locale.languageCode]['error_downloading_flutter'];
  }

  String get errorFlutterExistsInDirectory {
    return _localizedValues[locale.languageCode]['error_flutter_exists_in_directory'];
  }

  String get errorTwoVersionsFlutter {
    return _localizedValues[locale.languageCode]['error_two_versions_flutter'];
  }

  String get waitDiagnosis {
    return _localizedValues[locale.languageCode]['wait_diagnosis'];
  }

  String get ateloVersionError {
    return _localizedValues[locale.languageCode]['atelo_version_error'];
  }

  String get newVersionAtelo {
    return _localizedValues[locale.languageCode]['new_version_atelo'];
  }

  String get noNewVersionAtelo {
    return _localizedValues[locale.languageCode]['no_new_version_atelo'];
  }
}
