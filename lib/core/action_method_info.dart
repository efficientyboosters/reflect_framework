import 'package:flutter/widgets.dart';
import 'package:reflect_framework/core/annotations.dart';
import 'package:reflect_framework/core/item.dart';

import 'reflect_documentation.dart';
import 'reflect_framework.dart';
import 'service_class_info.dart';

/// ## [ActionMethod]
///
/// [ActionMethod]s are methods in a [ServiceObject] or [DomainObject] that comply with a set of rules and are therefore recognized by the [ReflectFramework].
///
/// [ActionMethod]s are displayed as menu items in a [ReflectGuiApplication] or as commands in other types of [ReflectApplication]s.
///
/// A method needs to comply to the following rules to be considered a [ActionMethod] if:
/// - the method is in a [ServiceObject] or [DomainObject]
/// - and the method is public (method name does not start with an underscore)
/// - and there is a [ActionMethodPreProcessor] that can process the method parameter signature.
/// - and there is a [ActionMethodProcessor] that can process the method result.
///

abstract class ActionMethod extends ConceptDocumentation {}

/// TODO explain what it does
///
/// The implementations of this class are generated by the [ReflectCodeGenerator]
abstract class ActionMethodInfo implements DynamicItem {
  Object get methodOwner;

  IconData get icon;
}

abstract class StartWithoutParameter implements ActionMethodInfo {
  /// Starts the ActionMethod process (e.g. when clicking on a menu button)
  /// This is implemented on a ActionMethodInfoWithoutParameter or ActionMethodInfoWithParameter and there is an parameter factory
  /// It:
  /// - calls the _createParameter() method (if it exists)
  /// - and then calls the _processParameter() method if it has a parameter
  /// - otherwise it will call invokeMethodAndProcessResult()
  /// - it will handle any exceptions that could be thrown
  void start(BuildContext context);
}

abstract class StartWithParameter implements ActionMethodInfo {
  /// Starts the ActionMethod process (e.g. when clicking on a menu button)
  /// This is implemented on a ActionMethodInfoWithParameter
  /// It:
  /// - calls the _processParameter() method
  /// - it will handle any exceptions that could be thrown
  void start(BuildContext context, Object parameter);
}

abstract class InvokeWithoutParameter implements ActionMethodInfo {
  /// This method is only called by [ActionMethodInfo.start]
  void invokeMethodAndProcessResult(BuildContext context);
}

abstract class InvokeWithParameter implements ActionMethodInfo {
  /// This method should only be called by a [ActionMethodParameterProcessor]
  /// (which might be delegated to a form ok or a dialog ok button)
  /// It:
  /// - invokes the method
  /// - and then calls the [ActionMethodResultProcessor] to process the results
  /// - it will handle any exceptions that could be thrown
  void invokeMethodAndProcessResult(BuildContext context, Object parameter);
}

// /// [ServiceObjectActionMethod]s are displayed on the main menu of an [ReflectGuiApplication] or are commands that can be accessed from the outside world in other type of [ReflectApplications]
// abstract class ServiceObjectActionMethodInfo extends ActionMethodInfo {
//   ServiceClassInfo get serviceObjectInfo;
// }

/// TODO explain what it does
class ActionMethodParameterFactory {}
