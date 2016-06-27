require 'spec_helper'

describe 'statsd' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "statsd class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('statsd::params') }
          it { is_expected.to contain_class('statsd::install').that_comes_before('statsd::config') }
          it { is_expected.to contain_class('statsd::config') }
          it { is_expected.to contain_class('statsd::service').that_subscribes_to('statsd::config') }

          it { is_expected.to contain_service('statsd') }
          it { is_expected.to contain_package('statsd').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'statsd class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('statsd') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
