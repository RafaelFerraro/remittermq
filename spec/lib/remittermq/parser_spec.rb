describe REmittermq::Parser do
  describe '.parse' do
    context 'when file is a .json' do
      let(:json_file) {
        File.new(File.expand_path("spec/support/json_files/family.json"))
      }

      it 'gets a json file and parser this one' do
        response = REmittermq::Parser.parse(json_file)

        expect(response).to be_an(Array)
        expect(response.first).to be_a(Hash)
      end
    end


    context 'when file is not a .json' do
      let(:jpeg_file) {
        File.new(File.expand_path("spec/support/other_files/test.jpeg"))
      }

      it 'raises a non valid exception' do
        expect{REmittermq::Parser.parse(jpeg_file)}.to raise_error(
          NonValidFileException
        )
      end
    end
  end
end