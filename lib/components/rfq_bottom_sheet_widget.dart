import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// B2B Request for Quote (RFQ) modal bottom sheet.
///
/// Usage:
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   backgroundColor: Colors.transparent,
///   builder: (context) => const RfqBottomSheetWidget(
///     productName: 'Combi oven',
///     productId: 'abc123',
///   ),
/// );
/// ```
class RfqBottomSheetWidget extends StatefulWidget {
  const RfqBottomSheetWidget({
    super.key,
    required this.productName,
    required this.productId,
  });

  final String productName;
  final String productId;

  @override
  State<RfqBottomSheetWidget> createState() => _RfqBottomSheetWidgetState();
}

class _RfqBottomSheetWidgetState extends State<RfqBottomSheetWidget> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  final _nameFocus = FocusNode();
  final _companyFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _messageFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    _nameFocus.dispose();
    _companyFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _messageFocus.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    // TODO: Send the inquiry to your backend (e.g. Firestore) here.
    // Available data: widget.productId, widget.productName,
    // _nameController.text, _companyController.text, _emailController.text,
    // _phoneController.text, _messageController.text.

    final theme = FlutterFlowTheme.of(context);
    final messenger = ScaffoldMessenger.of(context);

    Navigator.of(context).pop();

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          'Zapytanie wysłane / Inquiry sent successfully!',
          style: theme.bodyMedium.override(
            font: GoogleFonts.inter(),
            color: Colors.white,
            letterSpacing: 0.0,
          ),
        ),
        backgroundColor: theme.success,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  InputDecoration _decoration(
    BuildContext context, {
    required String label,
    IconData? icon,
  }) {
    final theme = FlutterFlowTheme.of(context);
    OutlineInputBorder border(Color color, [double width = 1.0]) =>
        OutlineInputBorder(
          borderSide: BorderSide(color: color, width: width),
          borderRadius: BorderRadius.circular(8.0),
        );

    return InputDecoration(
      labelText: label,
      labelStyle: theme.labelMedium.override(
        font: GoogleFonts.inter(),
        letterSpacing: 0.0,
      ),
      prefixIcon: icon == null
          ? null
          : Icon(icon, size: 20.0, color: theme.secondaryText),
      enabledBorder: border(theme.alternate),
      focusedBorder: border(theme.primary, 2.0),
      errorBorder: border(theme.error),
      focusedErrorBorder: border(theme.error, 2.0),
      filled: true,
      fillColor: theme.primaryBackground,
      contentPadding:
          const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
    );
  }

  Widget _field(
    BuildContext context, {
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    int maxLines = 1,
    String? Function(String?)? validator,
    FocusNode? nextFocus,
  }) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        maxLines: maxLines,
        minLines: maxLines > 1 ? 3 : 1,
        validator: validator,
        onFieldSubmitted: (_) => nextFocus?.requestFocus(),
        style: theme.bodyMedium.override(
          font: GoogleFonts.inter(),
          letterSpacing: 0.0,
        ),
        decoration: _decoration(context, label: label, icon: icon),
      ),
    );
  }

  String? _required(String? value) =>
      (value == null || value.trim().isEmpty)
          ? 'Pole wymagane / Required'
          : null;

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Pole wymagane / Required';
    }
    final valid = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim());
    return valid ? null : 'Nieprawidłowy e-mail / Invalid email';
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.92,
          maxWidth: 640.0,
        ),
        decoration: BoxDecoration(
          color: theme.secondaryBackground,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
          boxShadow: const [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x33000000),
              offset: Offset(0.0, -2.0),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Drag handle
                  Center(
                    child: Container(
                      width: 44.0,
                      height: 4.0,
                      margin: const EdgeInsetsDirectional.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: theme.alternate,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Zapytanie ofertowe / Request for Quote',
                          style: theme.headlineSmall.override(
                            font: GoogleFonts.interTight(),
                            color: theme.primaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.close, color: theme.secondaryText),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Product summary
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: theme.accent1,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: theme.primary),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.inventory_2_outlined, color: theme.primary),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productName,
                                style: theme.titleMedium.override(
                                  font: GoogleFonts.interTight(),
                                  color: theme.primaryText,
                                  letterSpacing: 0.0,
                                ),
                              ),
                              Text(
                                'ID: ${widget.productId}',
                                style: theme.labelSmall.override(
                                  font: GoogleFonts.inter(),
                                  color: theme.secondaryText,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _field(
                    context,
                    controller: _nameController,
                    focusNode: _nameFocus,
                    nextFocus: _companyFocus,
                    label: 'Imię i nazwisko / Full Name',
                    icon: Icons.person_outline,
                    validator: _required,
                  ),
                  _field(
                    context,
                    controller: _companyController,
                    focusNode: _companyFocus,
                    nextFocus: _emailFocus,
                    label: 'Firma / NIP - Company Name / NIP',
                    icon: Icons.business_outlined,
                    validator: _required,
                  ),
                  _field(
                    context,
                    controller: _emailController,
                    focusNode: _emailFocus,
                    nextFocus: _phoneFocus,
                    label: 'E-mail / Email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: _emailValidator,
                  ),
                  _field(
                    context,
                    controller: _phoneController,
                    focusNode: _phoneFocus,
                    nextFocus: _messageFocus,
                    label: 'Telefon / Phone Number',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validator: _required,
                  ),
                  _field(
                    context,
                    controller: _messageController,
                    focusNode: _messageFocus,
                    label: 'Wiadomość / Message / Notes',
                    icon: Icons.notes_outlined,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 4.0),
                  SizedBox(
                    height: 50.0,
                    child: ElevatedButton.icon(
                      onPressed: _submit,
                      icon: const Icon(Icons.send_rounded, size: 20.0),
                      label: Text(
                        'Wyślij zapytanie / Submit',
                        style: theme.titleSmall.override(
                          font: GoogleFonts.interTight(),
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primary,
                        foregroundColor: Colors.white,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
