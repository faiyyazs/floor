// TODO #375 delete once dependencies have migrated
// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:floor_generator/value_object/foreign_key.dart';
import 'package:test/test.dart';

void main() {
  group('foreign key tests', () {
    test('getDefinition for single child and parent column', () {
      final foreignKey = ForeignKey(
        'Person',
        ['id'],
        ['owner_id'],
        'CASCADE',
        'SET NULL',
      );

      final actual = foreignKey.getDefinition();

      const expected = 'FOREIGN KEY (`owner_id`)'
          ' REFERENCES `Person` (`id`)'
          ' ON UPDATE CASCADE'
          ' ON DELETE SET NULL';
      expect(actual, equals(expected));
    });

    test('getDefinition for multiple child and parent columns', () {
      final foreignKey = ForeignKey(
        'Person',
        ['id', 'foo'],
        ['owner_id', 'bar'],
        'CASCADE',
        'SET NULL',
      );

      final actual = foreignKey.getDefinition();

      const expected = 'FOREIGN KEY (`owner_id`, `bar`)'
          ' REFERENCES `Person` (`id`, `foo`)'
          ' ON UPDATE CASCADE'
          ' ON DELETE SET NULL';
      expect(actual, equals(expected));
    });
  });
}
