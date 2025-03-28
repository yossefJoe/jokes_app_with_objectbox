// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;

import 'objectbox_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 62731378568855353),
      name: 'Joke',
      lastPropertyId: const obx_int.IdUid(9, 6439588779257489108),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8726017574453717731),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4554805935924997275),
            name: 'category',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 993659412179860065),
            name: 'joke',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 8095670043116551111),
            name: 'setup',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 859732533308326837),
            name: 'delivery',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 2943459244649746113),
            name: 'type',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 6806628048782215162),
            name: 'jokeId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 5571320009474371548),
            name: 'safe',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 6439588779257489108),
            name: 'lang',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
obx.Store openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) {
  return obx.Store(getObjectBoxModel(),
      directory: directory,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 62731378568855353),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Joke: obx_int.EntityDefinition<Joke>(
        model: _entities[0],
        toOneRelations: (Joke object) => [],
        toManyRelations: (Joke object) => {},
        getId: (Joke object) => object.id,
        setId: (Joke object, int id) {
          object.id = id;
        },
        objectToFB: (Joke object, fb.Builder fbb) {
          final categoryOffset = object.category == null
              ? null
              : fbb.writeString(object.category!);
          final jokeOffset =
              object.joke == null ? null : fbb.writeString(object.joke!);
          final setupOffset =
              object.setup == null ? null : fbb.writeString(object.setup!);
          final deliveryOffset = object.delivery == null
              ? null
              : fbb.writeString(object.delivery!);
          final typeOffset =
              object.type == null ? null : fbb.writeString(object.type!);
          final langOffset =
              object.lang == null ? null : fbb.writeString(object.lang!);
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, categoryOffset);
          fbb.addOffset(2, jokeOffset);
          fbb.addOffset(3, setupOffset);
          fbb.addOffset(4, deliveryOffset);
          fbb.addOffset(5, typeOffset);
          fbb.addInt64(6, object.jokeId);
          fbb.addBool(7, object.safe);
          fbb.addOffset(8, langOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final typeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 14);
          final jokeIdParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 16);
          final categoryParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final jokeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 8);
          final safeParam =
              const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 18);
          final langParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 20);
          final setupParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final deliveryParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 12);
          final object = Joke(
              type: typeParam,
              jokeId: jokeIdParam,
              category: categoryParam,
              joke: jokeParam,
              safe: safeParam,
              lang: langParam,
              setup: setupParam,
              delivery: deliveryParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Joke] entity fields to define ObjectBox queries.
class Joke_ {
  /// See [Joke.id].
  static final id = obx.QueryIntegerProperty<Joke>(_entities[0].properties[0]);

  /// See [Joke.category].
  static final category =
      obx.QueryStringProperty<Joke>(_entities[0].properties[1]);

  /// See [Joke.joke].
  static final joke = obx.QueryStringProperty<Joke>(_entities[0].properties[2]);

  /// See [Joke.setup].
  static final setup =
      obx.QueryStringProperty<Joke>(_entities[0].properties[3]);

  /// See [Joke.delivery].
  static final delivery =
      obx.QueryStringProperty<Joke>(_entities[0].properties[4]);

  /// See [Joke.type].
  static final type = obx.QueryStringProperty<Joke>(_entities[0].properties[5]);

  /// See [Joke.jokeId].
  static final jokeId =
      obx.QueryIntegerProperty<Joke>(_entities[0].properties[6]);

  /// See [Joke.safe].
  static final safe =
      obx.QueryBooleanProperty<Joke>(_entities[0].properties[7]);

  /// See [Joke.lang].
  static final lang = obx.QueryStringProperty<Joke>(_entities[0].properties[8]);
}
