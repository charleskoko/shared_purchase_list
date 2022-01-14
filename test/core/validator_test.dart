import 'package:flutter_test/flutter_test.dart';
import 'package:shared_purchase_list/core/shared/validator.dart';

void main() {
  group('Validator', () {
    group('Email', () {
      test('should return null', () {
        // Arrange
        String email = 'exemple@email.com';
        // Act
        String? result = Validator.emailValidator(email);
        // Assert
        expect(result, null);
      });

      test('should return Please, enter a valid email address', () {
        // Arrange
        String email = 'exempemail.com';
        String expectedResult = 'Please, enter a valid email address';
        // Act
        String? result = Validator.emailValidator(email);
        // Assert
        expect(result, expectedResult);
      });

      test('should return Email field is required', () {
        // Arrange
        String email = '';
        String expectedResult = 'Email field is required';
        // Act
        String? result = Validator.emailValidator(email);
        // Assert
        expect(result, expectedResult);
      });
    });

    group('Password', () {
      test('should return null', () {
        // Arrange
        String password = 'isAPasswordTest@1';
        // Act
        String? result = Validator.passwordValidator(password);
        // Assert
        expect(result, null);
      });
      test('should return Please, enter a valid password', () {
        // Arrange
        String password = 'isatestpasssword';
        String expedtedResult = 'Please, enter a valid password';
        // Act
        String? result = Validator.passwordValidator(password);
        // Assert
        expect(result, expedtedResult);
      });
      test('should return Password field is required', () {
        // Arrange
        String password = '';
        String expedtedResult = 'Password field is required';
        // Act
        String? result = Validator.passwordValidator(password);
        // Assert
        expect(result, expedtedResult);
      });
    });

    group('Text', () {
      test('should return null', () {
        // Arrange
        String text = 'It is a text';
        String label = 'Label';
        // Act
        String? result = Validator.textValidator(
          text,
          label: label,
        );
        // Assert
        expect(result, null);
      });
      test('should return label is required', () {
        // Arrange
        String text = '';
        String label = 'Label';
        String expectedResult = '$label is required';
        // Act
        String? result = Validator.textValidator(
          text,
          label: label,
        );
        // Assert
        expect(result, expectedResult);
      });
    });
  });
}
