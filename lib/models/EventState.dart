enum EventState {
  notParticipated('NOT_PARTICIPATED'),
  paymentNeeded('PAYMENT_NEEDED'),
  awaiting('PAYMENT_PENDING'),
  approved('APPROVED'),
  closed('DECLINED');

  final String serverName;
  const EventState(this.serverName);
}
