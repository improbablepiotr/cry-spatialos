// Generated by SpatialOS codegen. DO NOT EDIT!
// source: improbable/vector3.schema
#ifndef SPATIALOS_SCHEMA_improbable_vector3_schema_3299486565006734624_INCLUDED
#define SPATIALOS_SCHEMA_improbable_vector3_schema_3299486565006734624_INCLUDED
#include <improbable/collections.h>
#include <improbable/worker.h>
#include <cstddef>
#include <cstdint>
#include <set>
#include <string>

struct Pbio;
struct Pbio_Object;

namespace improbable {

// Forward declarations.
//----------------------------------------------------------------

class Vector3d;
class Vector3f;

namespace detail {
}  // ::detail

// Enumerations.
//----------------------------------------------------------------

// Data classes.
//----------------------------------------------------------------

class IMPROBABLE_DLL_API Vector3d {
public:

	Vector3d() = default;
  // Main constructor.
  Vector3d(
      double x,
      double y,
      double z);
  // Creates a new instance with default values for each field.
  static Vector3d Create();

  // Copyable and moveable.
  Vector3d(Vector3d&&) = default;
  Vector3d(const Vector3d&) = default;
  Vector3d& operator=(Vector3d&&) = default;
  Vector3d& operator=(const Vector3d&) = default;
  ~Vector3d() = default;

  bool operator==(const Vector3d&) const;
  bool operator!=(const Vector3d&) const;

  // Field x = 1.
  double x() const;
  double& x();
  Vector3d& set_x(double);

  // Field y = 2.
  double y() const;
  double& y();
  Vector3d& set_y(double);

  // Field z = 3.
  double z() const;
  double& z();
  Vector3d& set_z(double);

private:
  double _x;
  double _y;
  double _z;
};

class IMPROBABLE_DLL_API Vector3f {
public:

	Vector3f() = default;
  // Main constructor.
  Vector3f(
      float x,
      float y,
      float z);
  // Creates a new instance with default values for each field.
  static Vector3f Create();

  // Copyable and moveable.
  Vector3f(Vector3f&&) = default;
  Vector3f(const Vector3f&) = default;
  Vector3f& operator=(Vector3f&&) = default;
  Vector3f& operator=(const Vector3f&) = default;
  ~Vector3f() = default;

  bool operator==(const Vector3f&) const;
  bool operator!=(const Vector3f&) const;

  // Field x = 1.
  float x() const;
  float& x();
  Vector3f& set_x(float);

  // Field y = 2.
  float y() const;
  float& y();
  Vector3f& set_y(float);

  // Field z = 3.
  float z() const;
  float& z();
  Vector3f& set_z(float);

private:
  float _x;
  float _y;
  float _z;
};

// Component metaclasses and update classes.
//----------------------------------------------------------------

// Implementation details.
//----------------------------------------------------------------

namespace detail {

void Write_Vector3d(const ::improbable::Vector3d&, ::Pbio_Object*);

::improbable::Vector3d Read_Vector3d(::Pbio_Object*);

void Write_Vector3f(const ::improbable::Vector3f&, ::Pbio_Object*);

::improbable::Vector3f Read_Vector3f(::Pbio_Object*);

}  // ::detail
}  // ::improbable

#endif  // SPATIALOS_SCHEMA_improbable_vector3_schema_3299486565006734624_INCLUDED
