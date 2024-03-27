// Redux
class CounterState {
  final int count;
  final int totalActions;
  final String lastActionPerformed;

  CounterState({
    required this.count,
    required this.totalActions,
    required this.lastActionPerformed,
  });

  static CounterState? fromJson(dynamic json) {
    return json != null
        ? CounterState(
            count: json["count"],
            totalActions: json["total_actions"],
            lastActionPerformed: json["last_action_performed"],
          )
        : null;
  }

  dynamic toJson() {
    return {
      'count': count,
      'total_actions': totalActions,
      'last_action_performed': lastActionPerformed,
    };
  }
}
