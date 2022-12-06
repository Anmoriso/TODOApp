// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TasksRecord> _$tasksRecordSerializer = new _$TasksRecordSerializer();

class _$TasksRecordSerializer implements StructuredSerializer<TasksRecord> {
  @override
  final Iterable<Type> types = const [TasksRecord, _$TasksRecord];
  @override
  final String wireName = 'TasksRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TasksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.details;
    if (value != null) {
      result
        ..add('details')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.checked;
    if (value != null) {
      result
        ..add('checked')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TasksRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TasksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'details':
          result.details = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'checked':
          result.checked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TasksRecord extends TasksRecord {
  @override
  final String? title;
  @override
  final String? details;
  @override
  final bool? checked;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TasksRecord([void Function(TasksRecordBuilder)? updates]) =>
      (new TasksRecordBuilder()..update(updates))._build();

  _$TasksRecord._({this.title, this.details, this.checked, this.ffRef})
      : super._();

  @override
  TasksRecord rebuild(void Function(TasksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TasksRecordBuilder toBuilder() => new TasksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TasksRecord &&
        title == other.title &&
        details == other.details &&
        checked == other.checked &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), details.hashCode), checked.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TasksRecord')
          ..add('title', title)
          ..add('details', details)
          ..add('checked', checked)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TasksRecordBuilder implements Builder<TasksRecord, TasksRecordBuilder> {
  _$TasksRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _details;
  String? get details => _$this._details;
  set details(String? details) => _$this._details = details;

  bool? _checked;
  bool? get checked => _$this._checked;
  set checked(bool? checked) => _$this._checked = checked;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TasksRecordBuilder() {
    TasksRecord._initializeBuilder(this);
  }

  TasksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _details = $v.details;
      _checked = $v.checked;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TasksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TasksRecord;
  }

  @override
  void update(void Function(TasksRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TasksRecord build() => _build();

  _$TasksRecord _build() {
    final _$result = _$v ??
        new _$TasksRecord._(
            title: title, details: details, checked: checked, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
