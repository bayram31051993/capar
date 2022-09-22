// ignore_for_file: constant_identifier_names

enum enmPayButtonType {
  capar,
  services,
  radar,
}

enum enmBankKartlar {
  turkmenbasyBank,
  dayhanBank,
  turkmenistanBank,
  halkBank,
  senagatBank,
  turkmenTurkBank,
  rysgalBank,
  milli,
  unknown,
}

enum enmTextFielType {
  none,
  nameField,
  surnameField,
  adressFiel,
  cellPhoneField,
  homePhoneField,
  agtsPhoneField,
  weightField,
  trafficFineField,
  vidoePhotopay,
  carNumField,
  amonutField,
  kod,
  trek,
  description,
  abonetTelefon,
  utils,
  energykWt,
  waterM3,
  gazM3,
  search,
  name,
  second_name,
  passport_id,
  brith_day,
  password,
  confPassword,
  user_register,
  ticket_from,
  ticket_to,
  ticket_passengers,
  ticket_depature,
  ticket_arrival,
  waterId,
  gazId,
  electroId,
  communalId,
  homeAddress
}

enum enmStorageKeys {
  none,
  havewalked,
  isDarkMode,
  local,
  cabinet,
  haveRead,
  phonesCell,
  homePhonesOther,
  agtshomePhones,
  addreses,
  carsNums,
  names,
  surnames,
  trackNums,
  caparList,
  cardList,
  administratives,
  abonentNum,
  msgId,
  initData,
  lockCode,
  cabelTV,
  token,
  waterId,
  gazId,
  electroId,
  communalId,
  user_register,
  ticketsUser,
  passengers,
  coockieSessionId
}

enum enmPersonalInfo {
  cellPhoneField,
  nameField,
  surnameField,
  carNumField,
  homeAddress,
  homePhoneField,
  waterId,
  gazId,
  electroId,
  communalId,
}

enum enmPaymentMedia {
  agtsIpTv,
  cabelTV,
}

enum enmPaymetnComunication {
  tmCell,
  tmTelekom,
  agtsInternet,
  agtsTelefon,
}

enum enmPaymentCommunal {
  utils,
  water,
  electro,
}

enum enmPaymentType {
  pygg,
  ticket,
  media,
  communcation,
  conmmunal,
  // telecomTV

  suw_tut,
  // tmcell,
  // airplane,
  // train,
  //student,
  // licese,

  //migration,
}

enum enmticketBack {
  airplane_back,
  train_back,
}

enum enmPaymentSort {
  all,
  capar,
  pygg,
  tmCell,
  tmTelekom,
  agtsInternet,
  agtsTelefon,
  agtsIpTv,
  utils,
  water,
  electro,
  cabelTV,
  student,
  licese,
  migration,
  telecomTV,
}

enum enmPaymentMethod {
  halkBank,
  senagat,
  rysgal,
  millicart,
  mobile,
  cash,
}

enum enmJemagatToleg {
  jemagat,
  electro,
  water,
  gaz,
}

enum enmDialogType {
  none,
  ok,
  error,
  info,
}

enum enmActionType {
  download,
  order,
  qrgen,
}
