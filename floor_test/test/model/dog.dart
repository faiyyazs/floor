part of '../database.dart';

@Entity(
  tableName: 'dog',
  foreignKeys: [
    ForeignKey(
      childColumns: ['owner_id'],
      parentColumns: ['id'],
      entity: Person,
      onDelete: ForeignKeyAction.CASCADE,
    )
  ],
)
class Dog {
  @PrimaryKey()
  final int id;

  final String name;

  @ColumnInfo(name: 'owner_id')
  final int ownerId;

  Dog(this.id, this.name, this.ownerId);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Dog &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              ownerId == other.ownerId;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ ownerId.hashCode;

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, ownerId: $ownerId}';
  }
}