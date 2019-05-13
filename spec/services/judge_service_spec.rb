require 'rails_helper'
# require 'services/judge_service'
describe JudgeService do
  describe 'birds' do

      it 'flush?を行うとき判定がtrueであること' do
        service = JudgeService.new('H1 H12 H10 H5 H3')
        characters = service.instance_variable_get('@characters')
        expect(service.flush?(characters)).to eq true
      end
      it 'flush?を行うとき判定がfalseであること' do
        service = JudgeService.new('C7 C6 C5 C4 H3')
        characters = service.instance_variable_get('@characters')
        expect(service.flush?(characters)).to eq false
      end


      it 'straight?を行うとき判定がtrueであること' do
        service = JudgeService.new('S8 S7 H6 H5 S4')

        expect(service.straight?).to eq true
      end
      it 'straight?を行うとき判定がfalseであること' do
        service = JudgeService.new('S9 S7 H6 H5 S4')
        expect(service.straight?).to eq false
      end


      describe '#judge' do

      it 'judgeを行うとき判定がストレートフラッシュ' do
        service = JudgeService.new('C7 C6 C5 C4 C3')

        expect(service.birds).to eq('ストレートフラッシュ')
      end
      it 'judgeを行うとき判定がフォー・オブ・ア・カインド' do
        service = JudgeService.new('C10 D10 H10 S10 D5')
        expect(service.birds).to eq('フォー・オブ・ア・カインド')
      end
      it 'judgeを行うとき判定がフルハウス' do
        service = JudgeService.new('S10 H10 D10 S4 D4 ')
        expect(service.birds).to eq('フルハウス')
      end
      it 'judgeを行うとき判定がフラッシュ' do
        service = JudgeService.new('H1 H12 H10 H5 H3')
        expect(service.birds).to eq('フラッシュ')
      end
      it 'judgeを行うとき判定がストレート' do
        service = JudgeService.new('S8 S7 H6 H5 S4')
        expect(service.birds).to eq('ストレート')
      end
      it 'judgeを行うとき判定がスリー・オブ・ア・カインド' do
        service = JudgeService.new('S12 C12 D12 S5 C3 ')
        expect(service.birds).to eq('スリー・オブ・ア・カインド')
      end
      it 'judgeを行うとき判定がツーペア' do
        service = JudgeService.new('H13 D13 C2 D2 H11')
        expect(service.birds).to eq('ツーペア')
      end
      it 'judgeを行うとき判定がワンペア' do
        service = JudgeService.new('C10 S10 S6 H4 H2')
        expect(service.birds).to eq('ワンペア')
      end
      it 'judgeを行うとき判定がハイカード' do
        service = JudgeService.new('D1 D10 S9 C5 C4')
        expect(service.birds).to eq('ハイカード')
      end
        end

    end

end
