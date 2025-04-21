import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class PracticeScreen extends StatefulWidget {
  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int _currentStep = 0;
  final _controller = PageController();
  final TextEditingController _intentionController = TextEditingController();
  bool _loading = false;
  String? _iaResult;

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() => _currentStep++);
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
      _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  Future<void> _generatePlan() async {
    setState(() {
      _loading = true;
      _iaResult = null;
    });
    final result = await AIService.generateManifestationPlan(_intentionController.text.trim());
    if (result['success']) {
      setState(() {
        _iaResult = result['response'];
      });
    } else {
      setState(() {
        _iaResult = 'Error: ${result['error']}';
      });
    }
    setState(() {
      _loading = false;
      _currentStep++;
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daily Guided Practice')),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildStepOne(),
          _buildStepTwo(),
          _buildStepThree(),
          _buildStepFour(),
          _buildResultStep(),
        ],
      ),
    );
  }

  Widget _buildStepOne() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1. Set Your Intention', style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 20),
          TextField(
            controller: _intentionController,
            decoration: InputDecoration(labelText: 'What do you want to manifest today?'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: _generatePlan,
            child: Text('Generate Plan with Lúa'),
          ),
        ],
      ),
    );
  }

  Widget _buildStepTwo() {
    return _stepTemplate(
      title: '2. Visualization',
      description: 'Close your eyes and imagine your intention as real. Feel it.',
    );
  }

  Widget _buildStepThree() {
    return _stepTemplate(
      title: '3. Journaling',
      description: 'Write as if your manifestation has already come true.',
    );
  }

  Widget _buildStepFour() {
    return _stepTemplate(
      title: '4. Aligned Action',
      description: 'What small step can you take today to support your intention?',
    );
  }

  Widget _buildResultStep() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: _loading
          ? Center(child: CircularProgressIndicator())
          : _iaResult != null
              ? SingleChildScrollView(child: Text(_iaResult!, style: TextStyle(fontSize: 16)))
              : Center(child: Text('No response yet.')),
    );
  }

  Widget _stepTemplate({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: 20),
          Text(description, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 40),
          ElevatedButton(onPressed: _nextStep, child: Text('Next')),
          if (_currentStep > 0)
            TextButton(onPressed: _previousStep, child: Text('Back')),
        ],
      ),
    );
  }
}
