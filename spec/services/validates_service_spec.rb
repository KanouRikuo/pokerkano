require 'rails_helper'

describe ValidatesService do
  let(:card_class) { Struct.new(:card) { include ValidatesService } }
  # let(:form) { CardForm.new(params) }

  #カードの組が５つあると成功
  describe ".valid1" do
    # let(:content1) { card_class.new(params)  }
    context "validation1" do
      let(:params) {'A1 A2 A3 A4 A5'}
      service = JudgeService.new('A1 A2 A3 A4 A5')
      service.role_judgment
      it "valid1を行うとき判定がtrueであること" do
        expect(service.card_size).to eql true
      end
    end
    context "validation1" do
      service = JudgeService.new('A1 A2 A3 A4 A5 tt')
      service.role_judgment
      it "valid1を行うとき判定がfalseであること" do
        expect(service.card_size).to eql false
      end
    end
  end
  # ５つある前提で文字と数字が異なると失敗
  describe ".valid2" do
    context "validation2" do
      service = JudgeService.new('H1 H2 H3 H4 H5')
      service.role_judgment
      it "valid2を行うとき判定がtrueであること" do
        expect(service.card_combination).to eql true
      end
    end
    context "validation2" do
      service = JudgeService.new('A1 A2 A3 A4 A5')
      service.role_judgment
      it "valid2を行うとき判定がfalseであること" do
        expect(service.card_combination).to eql false
      end
    end
  end
  describe ".valid3" do
    # let(:content1) { card_class.new  }
    context "validation3" do
      service = JudgeService.new('Y1 A3 A2 A4 A5')
      service.role_judgment
      it "valid3を行うとき判定がtrueであること" do
        expect(service.card_overlap).to eql true
      end
    end
    context "validation3" do
      service = JudgeService.new('Y1 A2 A2 A4 A5')
      service.role_judgment
      it "valid3を行うとき判定がfalseであること" do
        expect(service.card_overlap).to eql false
      end
    end
  end



  end
