///TODO explain what a [ServiceClass] is
///
/// A class is recognized by the [ReflectFramework] if the class:
/// - Is preceded with a @[ServiceClass] annotation.
/// - Has one or more [ActionMethod]s
/// - Has no [Properties] ([ServiceObject]s should be stateless).
/// - Has a empty constructor or a function:
///   - a public function (name does not start with _)
///   - with a function name the same name as the serviceClass + "Factory" suffix,
///   - without function parameters
///   - that returns a new [ServiceObject],
///   e.g.:
///   ProductService productServiceFactory() {
///       ProductService productService=//your code to create a ProductService object e.g. using other classes or your favourite dependency injection framework)
///       return productService;
///   }

class ServiceObject {
  ///For documentation only
}

abstract class ClassInfo {
  /// Translated name
  String get displayName;
}

/// The [ReflectFramework] creates info classes (with [ServiceClassInfoCode]) that implement [ServiceClassInfo] for all classes that are recognized as [ServiceObject]s.
abstract class ServiceClassInfo extends ClassInfo {
  ///[ServiceObject]s and [DomainObject]s do not have an icon (for now)

  /// same (cached) instance of the [ServiceObject]
  /// e.g. final ProductService serviceObject=productServiceFactory();//or ProductService()
  Object get serviceObject;

  /// If the [ServiceObject] is accessible (e.g. visible in the menu's)
  bool get visible {
//    return actionMethods.any((a) => a.visible);
    return true;
  }

// List<ActionMethodInfo> get actionMethods;

// /// Order of the [ServiceObject], e.g.: the lower the number, the higher the [ServiceObject] appears in the menu's.
// double get order;
}
